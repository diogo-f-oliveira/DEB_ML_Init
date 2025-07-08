function [data, auxData, metaData, txtData, weights] = mydata_Forsterygion_lapillum 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Blenniiformes'; 
metaData.family     = 'Tripterygiidae';
metaData.species    = 'Forsterygion_lapillum'; 
metaData.species_en = 'Common triplefin'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcd', 'jiMi'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.8); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lj'; 'Lp'; 'Li'; 'GSI'; 'rB'}; 
metaData.data_1     =  {'t-L'; 'L-W'; 'T-JO'}; 

metaData.COMPLETE = 2.7; % using criteria o LikaKear2011

metaData.author   = {'Vittoria Cipriani', 'Cristian Monaco', 'Ivan Nagelkerken'};    
metaData.date_subm = [2020 09 26];              
metaData.email    = {'vittoria.cipriani@adelaide.edu.au','cristian.monaco@ifremer.fr','ivan.nagelkerken@adelaide.edu.au'};            
metaData.address  = {'UoA University of Adelaide'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 09 28]; 


%% set data
% zero-variate data
data.ah = 14;    units.ah = 'd';    label.ah = 'age at hatching';                         bibkey.ah = 'ShimSwea2009';   
  temp.ah = C2K(20);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.tb = 1;    units.tb = 'd';    label.tb = 'time since hatching at birth';             bibkey.tb = 'ShimSwea2009';   
  temp.tb = C2K(20);  units.temp.tb = 'K'; label.temp.tb = 'temperature';
data.tj = 52;    units.tj = 'd';    label.tj = 'time since hatching at metamorphosis';    bibkey.tj = 'ShimSwea2009';
  temp.tj = C2K(19.8);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 270;    units.tp = 'd';    label.tp = 'time since hatching at puberty';         bibkey.tp = 'Fran2001';
  temp.tp = C2K(19.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 730;    units.am = 'd';    label.am = 'life span';                              bibkey.am = 'Fran2001';   
  temp.am = C2K(19.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh  = 0.49;   units.Lh  = 'cm';  label.Lh  = 'total length at hatch';                bibkey.Lh  = 'Fric1994';
data.Lj = 2.78;   units.Lj = 'cm';   label.Lj = 'total length at metamorphosis';          bibkey.Lj  = 'McDeShim2006';
data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';                 bibkey.Lp  = 'Fran2001'; 
data.Li  = 8;   units.Li  = 'cm';  label.Li  = 'ultimate total length';                   bibkey.Li  = 'Wiki';
  comment.Li = 'TL 4 - 8 cm; fishbase gives SL 6.7 cm, which corresponds with TL 8 cm, see F1';

data.Wwb = 7.36e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Mens2014';
  comment.Wwb = 'based on egg diameter of 1.12 mm: pi/6*0.112^3';
data.Wwj = 0.1831;   units.Wwj = 'g';   label.Wwj = 'metamorphosis wet weight';      bibkey.Wwj = 'TaylWill1998';
  comment.Wwj = 'based on W = 4.174e-6 * TL^3.214 (TL = 27.82 mm)';
data.Wwp = 1.2052;   units.Wwp = 'g';   label.Wwp = 'puberty wet weight';      bibkey.Wwp = 'TaylWill1998';
  comment.Wwp = 'based on W = 4.174e-6 * TL^3.214 (TL = 50 mm)';
data.Wwi = 5.4586;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'TaylWill1998';
  comment.Wwi = 'based on W = 4.174e-6 * TL^3.214 (TL = 80 mm)';

% data.Ri  = 8400/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';            bibkey.Ri  = 'Thom1986';   
% temp.Ri = C2K(17);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.GSI = 0.28; units.GSI = '-';  label.GSI = 'gonado somatic index';        bibkey.GSI = 'Nage2017';
  temp.GSI = C2K(19.8);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI =  'Max GSI for females, year 2017 at White Islands (F. lapillum)';

data.rB = 1.20/365; units.rB  = '1/d';   label.rB  = 'von Bert growth rate';           bibkey.rB  = 'TaylWill1998';   
  temp.rB = C2K(17);  units.temp.rB = 'K'; label.temp.rB = 'temperature';

 
%% uni-variate data
% t-L data
data.tL = [ ... % time since hatch , total length (cm)
122     2.9
137     2.5
140     2.6
147     2.7
149     2.6
150     2.8
152     3.5
157     2.9
157     2.8
160     3.6
162     3.1
164     2.5
165     3.8
167     3
168     2.7
172     3
177     4.4
177     3.4
177     4.6
178     4.2
179     3.4
180     3.1
181     3.9
182     3.7
182     3.9
183     3.4
183     2.8
184     4.9
185     2.8
185     3.5
187 	2.9
188     2.4
189     4.3
189 	4.2
189 	5.2
189 	3.6
190 	5
190 	3.3
194     3.5
195     4.7
195     3.7
196     3.6
197     3.4
199     4.2
199     4.1
200     5.1
200     4
201     4.4
204     4.1
204     3.2
205     3
206     3.2
208     4.4
208 	4.8
208     4.6
209     3.6
210     5.2
211     4.7
211     3.8
212 	4.6
212 	4.5
213 	5
213 	4.1
214 	4.8
214 	4.4
214 	4.6
215 	3.7
216 	5.2
216 	6
216 	3.4
217 	3.7
217 	4.5
218 	5.6
218     5.1
218     5.7
219 	5.1
219 	4.8
220     4.3
220     3.9
220 	4.3
220 	4.7
221 	5
221     3.8
221     5.4
222     5.2
222     6.2
223     4
224     4.8
224     6.5
224     3.9
225     4.4
225     4.3
226     3.4
227     6.4
227     4
227     3.8
227 	3.6
227     5.6
228     5.2
229     5.6
229     4.1
230     4.2
230     4
233     6.2
233     4
233 	6.2
234     6.1
234     4.3
234     3.7
234 	5.5
235 	5.3
236 	4.4
236 	4
237 	5.8
237 	4.5
238 	5.6
239 	3.4
239     4.3
239     6.3
239 	3.9
240 	4.4
241     4.9
242 	5.2
242 	4.6
243     4.9
244     4.3
245 	5
245 	6.1
246 	4.2
247 	2.5
247 	3.1
248 	5.7
248 	5.1
248 	4.7
252     4
252     5.4
252     4.6
253     4.4
253     5.7
253     5.3
254     5.5
254 	6.4
254     5.8
255 	4.5
257     3.7
257 	5.1
259 	5.6
259 	6.3
259     6.3
259     4.4
260     5
262     7.1
263     6.2
264 	5.6
264     5
265     6
265     5.9
268 	6
270     5.9
274 	4.5
274 	5.6
275     5.5
276 	5.8
276 	6
277     6.2
278     5.2
279     5.8
280     6.2
280     6.4
280 	4.7
281 	5.4
281     5.7
281     5.6
284     5
284     3.8
287     5.5
291     6.2
293 	6.2
293 	5.3
293 	4.3
293 	4.3
295     5.5
298     6.2
301     4.7
304     5.7
305 	5.5
305 	5.5
306     4.7
313 	4.2
314     5.3
314     6.3
323     6.5
323     5.5
324     6.4
329     6.2
332     6.7
337     5.3
338 	5.4
348     5.5
349     4.6
379     6];
units.tL  = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Foch2018';

% L-W data females and males
data.LW = [ ... % total length (cm), wet weight (g)
5.7	1.36
3.9	0.37 
5.1	1.05 
4.6	0.73 
4.7	0.68 
4.7	0.76 
3.9	0.27 
3.9	0.33 
4.5	0.67 
4.7	0.61 
5.0	0.86 
4.2	0.38 
4.1	0.43 
3.7	0.35 
4.4	0.43 
5.1	1.04 
4.5	0.65 
4.1	0.29 
4.5	0.47 
4.4	0.43 
5.3	1.70 
6.3	2.17 
5.0	1.00 
5.8	1.71 
4.1	0.48 
3.9	0.44 
5.8	1.66 
5.0	0.93 
5.0	0.96 
4.7	0.82 
4.2	0.57 
4.6	0.88 
4.9	0.94 
4.6	0.76 
4.7	0.92 
4.2	0.46 
4.7	0.85 
4.7	0.75 
4.9	0.77 
3.7	0.31 
4.3	0.44 
4.3	0.47
5.2	0.98 
5.7	1.36 
4.3	0.48 
5.1	0.81 
4.9	0.64 
5.2	1.00 
4.4	0.47 
5.2	1.00 
4.8	0.74 
4.0	0.36 
4.3	0.52 
4.7	0.79 
3.7	0.38 
5.7	1.00 
3.9	0.49 
4.6	0.74 
6.1	1.59 
4.7	0.64 
5.8	1.64 
5.3	0.88 
5.2	0.92 
5.0	0.62 
4.2	0.38 
5.0	0.75 
4.4	0.51 
4.5	0.44 
4.9	0.69 
4.7	0.67 
5.8	1.45 
4.7	0.67 
4.7	0.66 
4.6	0.78 
5.3	1.10 
5.1	0.99 
4.8	0.79 
4.9	0.84 
4.8	0.61 
5.6	1.40 
4.5	0.49 
5.0	0.88];   
units.LW = {'cm', 'g'};     
label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Nage2017';

% Dioxygen consumption per g wet weight at different temperatures
data.TJO1 = [... % temperature(C),	specific metabolic rate (mg_O2_g-1_hr-1)
    15 0.088;
    18 0.103;
    21 0.138];
units.TJO1   = {'C', 'mg O_2/h.g'}; label.TJO1 = {'temperature', 'specific metabolic rate', 'KhanHerb2012'};  
bibkey.TJO1 = 'KhanHerb2012';
comment.TJO1 = 'wet weight 2.1 g';

% Dioxygen consumption per g wet weight at different temperatures
data.TJO2 = [ ... % temperature(C),	specific metabolic rate (mg_O2_g-1_hr-1)
    15 0.116
    18 0.121
    21 0.149
    24 0.19];
units.TJO2 = {'C', 'mg O_2/h.g'}; label.TJO2 = {'temperature', 'specific metabolic rate', 'McArHick2017'};  
bibkey.TJO2 = 'McArHick2017';
comment.TJO2 = 'wet weight 1.43 g';

%% set weights or all real data
weights = setweights(data, []);
weights.tj = 0 * weights.tj;
weights.Lj = 0 * weights.Lj;
weights.Wwj = 0 * weights.Wwj;
weights.rB = 0 * weights.rB;
weights.Li = 5 * weights.Li;
weights.tL = 10 * weights.tL;
weights.TJO1 = 5 * weights.TJO1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData or output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
sets1 = {'TJO1', 'TJO2'}; subtitle1 = {'Data from  KhanHerb2012, McArHick2017'};
metaData.grp.sets = {sets1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Curator remark: Data (tj,Lj,Wwj) was ignorned due to inconsistency with tL and TJO data)';
D2 = 'Curator remark: Data rB was ignored since we need to work with original data, not with statistics (rB depends on f; moreover we apply the abj model, not the std model, which might affect the estimate of rB)';
metaData.discussion = struct('D1',D1,'D2',D2);  

%% Facts
F1 = 'length - length from photo: SL = 0.84 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Males guard nests';
metaData.bibkey.F2 = 'Fran2001'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6JJ9F'; % Cat of Life
metaData.links.id_ITIS = '638492'; % ITIS
metaData.links.id_EoL = '46574222'; % Ency of Life
metaData.links.id_Wiki = 'Forsterygion_lapillum'; % Wikipedia
metaData.links.id_ADW = 'Forsterygion_lapillum'; % ADW
metaData.links.id_Taxo = '174538'; % Taxonomicon
metaData.links.id_WoRMS = '280796'; % WoRMS
metaData.links.id_fishbase = 'Forsterygion-lapillum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Forsterygion_lapillum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting o chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ... 
'year = {2010}, ' ... 
'title  = {Dynamic Energy Budget theory or metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ... 
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
bibkey = 'Foch2018'; type = 'phdthesis'; bib = [ ... 
'author = {R. C. Foch}, ' ...  
'title  = {Weathering the storm: the implications of wave exposure on the distribution, phenotype and growth of a temperate reef fish}, ' ...
'school = {Victoria University of Wellington}, ' ...
'year = {2018}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fran2001'; type = 'Book'; bib = [ ...  
'author = {Francis, M.}, ' ... 
'year = {2001}, ' ... 
'title  = {Coastal fishes of New Zealand: an identification guide, 3rd edn. Reed Books, Auckland}, ' ...
'publisher = {Reed Books}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fric1994'; type = 'book'; bib = [...
'author = {Fricke, Ronald}, ', ...
'year = {1994}, ', ...
'title = {Tripterygiid Fishes of Australia, New Zealand and the Southwest Pacific Ocean: With Descriptions of 2 New Genera and 16 New Species (Teleostei)},'...
'volume = {24},'...
'publisher = {Lubrecht \& Cramer Limited}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 %
bibkey = 'KhanHerb2012'; type= 'article'; bib = [...
'author = {J.R, Khan and N.A, Herbert}, ' ...
'year = {2012}, ' ...
'title = {The behavioural thermal preference of the common triplefin (\emph{Forsterygion lapillum}) tracks aerobic scope optima at the upper thermal limit of its distribution}, ' ...
'journal = {Journal of Thermal Biology}, ' ...
'volume = {37}, ' ...
'number = {2}, ' ...
'pages = {118-124}, ' ...
'DOI = {10.1016/j.jtherbio.2011.11.009}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McArHick2017'; type= 'article'; bib = [...
'author = {McArley, Tristan J. and Hickey, Anthony and Herbert, Neill A.}, '...
'title = {Chronic warm exposure impairs growth performance and reduces thermal safety margins in the common triplefin fish (\emph{Forsterygion lapillum})}, '...
'journal = {Journal of Experimental Biology }, '...
'volume = {220}, '...
'number= {19}, '...
'pages = {3527-3535}, '...
'year = {2017}, '...
'DOI = {doi:10.1242/jeb.162099}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McDeShim2006'; type= 'article'; bib = [...
'author = {McDermott, C. J. and Shima, J. S.}, ' ...
'title = {Ontogenetic shifts in microhabitat preference o the temperate reef fish \emph{Forsterygion lapillum}: implications or population limitation}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {320}, ' ...
'pages = {259-266}, ' ...
'year = {2006}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nage2017'; type= 'misc'; bib = [...
'author = {Nagelkerken, I.}, '...
'note = {Unpublished data}, ' ...
'year = {2017}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShimSwea2009' ; type = 'article' ; bib = [...
'author = {Shima, J. S. and Swearer, S. E.},'...
'title = {Larval quality is shaped by matrix efects: implications of connectivity in a marine metapopulation},'...
'year = {2009}, ' ...
'journal = {Ecology},'...
'volume = {90},'...
'number = {5},'...
'pages = {1255-1267}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%  
bibkey = 'TaylWill1998' ; type = 'article' ; bib = [...
'author = {Taylor, Richard and Willis, Trevor}, '...
'year = {1998}, '...
'title = {Relationships Amongst Length, Weight and Growth of North-Eastern {N}ew {Z}ealand Reef fishes},'...
'journal = {Marine and freshwater Research},'...
'volume = {49}, '...
'pages = {255-260}, '...
'doi = {10.1071/M97016}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
% bibkey = 'Thom1986' ; type = 'article' ; bib = [...
% 'author = {Thompson, S.}, '...
% 'year = {1986}, '...
% 'title = {Male spawning success and female choice in the mottled triplefin,\emph{Forsterygion varium} ({P}isces: {T}ripterygiidae)},'...
% 'journal = {Animal Behaviour},'...
% 'volume = {34}, '...
% 'pages = {580-589}, '...
% 'doi = {10.1016/S0003-3472(86)80127-0}'];
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mens2014' ; type = 'phdthesis' ; bib = [...
'author = {Mensink, Paul J.}, '...
'year = {2014}, '...
'title = {Factors influencing the recruitment, growth and reproduction of a temperate reef fish, \emph{Forsterygion lapillum}},'...
'school = {Victoria Univ of Wellington}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Forsterygion-lapillum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

