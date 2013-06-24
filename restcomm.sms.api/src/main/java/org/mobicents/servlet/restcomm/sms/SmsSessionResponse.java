/*
 * This is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software; if not, write to the Free
 * Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301 USA, or see the FSF site: http://www.fsf.org.
 */
package org.mobicents.servlet.restcomm.sms;

/**
 * @author quintana.thomas@gmail.com (Thomas Quintana)
 */
public final class SmsSessionResponse {
  private final SmsSessionInfo info;
  private final boolean success;
  
  public SmsSessionResponse(final SmsSessionInfo info, final boolean success) {
    super();
    this.info = info;
    this.success = success;
  }
  
  public SmsSessionInfo info() {
    return info;
  }
  
  public boolean succeeded() {
    return success;
  }
}
