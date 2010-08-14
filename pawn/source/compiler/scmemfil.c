/*  Pawn compiler
 *
 *  Routines to maintain a "text file" in memory, based on memory interface
 *  functions by faluco of the AMX Mod X team.
 *
 *  Copyright (c) ITB CompuPhase, 2003-2009
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"); you may not
 *  use this file except in compliance with the License. You may obtain a copy
 *  of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 *  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 *  License for the specific language governing permissions and limitations
 *  under the License.
 *
 *  Version: $Id: scmemfil.c 4125 2009-06-15 16:51:06Z thiadmer $
 */

#include <assert.h>
#include <string.h>
#include "memfile.h"

#if defined FORTIFY
  #include <alloc/fortify.h>
#endif

typedef memfile_t MEMFILE;
#define tMEMFILE  1
#include "sc.h"


MEMFILE *mfcreate(const char *filename)
{
  return memfile_creat(filename, 4096);
}

void mfclose(MEMFILE *mf)
{
  memfile_destroy(mf);
}

int mfdump(MEMFILE *mf)
{
  FILE *fp;
  int okay;

  assert(mf!=NULL);
  /* create the file */
  fp=fopen(mf->name, "wb");
  if (fp==NULL)
    return 0;

  okay = (fwrite(mf->base, mf->usedoffs, 1, fp)==(size_t)mf->usedoffs);

  fclose(fp);
  return okay;
}

long mflength(const MEMFILE *mf)
{
  return mf->usedoffs;
}

long mfseek(MEMFILE *mf,long offset,int whence)
{
  long length;

  assert(mf!=NULL);
  if (mf->usedoffs == 0)
    return 0L;          /* early exit: not a single byte in the file */

  /* find the size of the memory file */
  length=mflength(mf);

  /* convert the offset to an absolute position */
  switch (whence) {
  case SEEK_SET:
    break;
  case SEEK_CUR:
    offset+=mf->offs;
    break;
  case SEEK_END:
    assert(offset<=0);
    offset+=length;
    break;
  } /* switch */

  /* clamp to the file length limit */
  if (offset<0)
    offset=0;
  else if (offset>length)
    offset=length;

  /* set new position and return it */
  memfile_seek(mf, offset);
  return offset;
}

unsigned int mfwrite(MEMFILE *mf,const unsigned char *buffer,unsigned int size)
{
  return (memfile_write(mf, buffer, size) ? size : 0);
}

unsigned int mfread(MEMFILE *mf,unsigned char *buffer,unsigned int size)
{
  return memfile_read(mf, buffer, size);
}

char *mfgets(MEMFILE *mf,char *string,unsigned int size)
{
  char *ptr;
  unsigned int read;
  long seek;

  assert(mf!=NULL);

  read=mfread(mf,(unsigned char *)string,size);
  if (read==0)
    return NULL;
  seek=0L;

  /* make sure that the string is zero-terminated */
  assert(read<=size);
  if (read<size) {
    string[read]='\0';
  } else {
    string[size-1]='\0';
    seek=-1;            /* undo reading the character that gets overwritten */
  } /* if */

  /* find the first '\n' */
  ptr=strchr(string,'\n');
  if (ptr!=NULL) {
    *(ptr+1)='\0';
    seek=(long)(ptr-string)+1-(long)read;
  } /* if */

  /* undo over-read */
  assert(seek<=0);      /* should seek backward only */
  if (seek!=0)
    mfseek(mf,seek,SEEK_CUR);

  return string;
}

int mfputs(MEMFILE *mf,const char *string)
{
  unsigned int written,length;

  assert(mf!=NULL);

  length=strlen(string);
  written=mfwrite(mf,(unsigned char *)string,length);
  return written==length;
}