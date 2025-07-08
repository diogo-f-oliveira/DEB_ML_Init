  function [data, auxData, metaData, txtData, weights] = mydata_Engraulis_capensis

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Engraulis_capensis'; 
metaData.species_en = 'Southern African anchovy'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 19];

%% set data
% zero-variate data
data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(13.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(13.7); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on  Engraulis encrasicolus';

data.Lp = 9.5;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'fishbase';
data.Li = 17;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 3e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.2 mm and width 0.7 mm of Engraulis_anchoita: pi/6*0.12*0.07^2';
data.Wwi = 50.5; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00457*(Li/0.86)^3.12, see F1';
  
data.Ri = 10e3*30/365;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'Moto1996';   
  temp.Ri = C2K(13.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'rel anual fecundity for Engraulis encrasicolus: 9-11e3/g';
  
% uni-variate data

% time-length
data.tL_S = [ ... % time since birth (d), total length (cm)
154.689	9.802
186.704	9.527
191.091	8.488
192.185	8.269
205.741	8.377
222.565	8.185
233.311	10.453
248.549	9.331
260.948	11.025
264.782	10.205
272.968	9.111
274.001	10.259
276.704	10.450
280.506	10.340
298.400	10.476
306.483	11.651
312.476	11.076
373.764	11.181
375.916	11.591
387.859	11.371
398.138	11.972];
units.tL_S = {'d', 'cm'};  label.tL_S = {'time since birth', 'total length','South Coast'}; 
temp.tL_S = C2K(13.7); units.temp.tL_S = 'K'; label.temp.tL_S = 'temperature';
bibkey.tL_S = 'WaldArms1989';
%
data.tL_W = [ ... % time since birth (d), total length (cm)
126.109	6.087
135.278	7.234
161.883	6.658
166.737	7.259
171.042	8.024
173.741	8.325
176.458	8.215
178.698	6.657
186.273	7.067
186.782	7.805
187.263	9.171
188.959	7.641
190.029	7.968
193.805	8.433
204.719	6.983
207.944	7.639
209.045	7.284
211.249	6.518
217.095	9.197
219.306	8.267
222.077	6.982
228.435	10.317
240.426	9.031
250.227	8.210
254.528	9.057
258.358	8.319
267.546	9.056
270.811	8.838
273.062	7.033
283.820	9.028
289.248	8.946];
units.tL_W = {'d', 'cm'};  label.tL_W = {'time since birth', 'total length','West Coast'}; 
temp.tL_W = C2K(13.7); units.temp.tL_W = 'K'; label.temp.tL_W = 'temperature';
bibkey.tL_W = 'WaldArms1989';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_S = 3 * weights.tL_S;
weights.tL_W = 3 * weights.tL_W;
weights.ab = 0 * weights.ab;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_S','tL_W'}; subtitle1 = {'Data from South and West coast of S-Africa'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.00457*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'total length- standard length: SL = 0.86 * TL, based on photo';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '39TKZ'; % Cat of Life
metaData.links.id_ITIS = '551339'; % ITIS
metaData.links.id_EoL = '46562561'; % Ency of Life
metaData.links.id_Wiki = 'Engraulis_capensis'; % Wikipedia
metaData.links.id_ADW = 'Engraulis_capensis'; % ADW
metaData.links.id_Taxo = '42684'; % Taxonomicon
metaData.links.id_WoRMS = '219983'; % WoRMS
metaData.links.id_fishbase = 'Engraulis-capensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Engraulis_capensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WaldArms1989'; type = 'Article'; bib = [ ...  
'author = {M. Waldron and M. J. Armstrong and R. M. Prosch}, ' ...
'year = {1989}, ' ...
'title = {ASPECTS OF THE VARIABILITY IN GROWTH OF JUVENILE ANCHOVY \emph{Engraulis capensis} IN THE SOUTHERN {B}ENGUELA SYSTEM}, ' ... 
'journal = {S. Afr. J. mar. Sci.}, ' ...
'volume = {58}, '...
'pages = {9-19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Moto1996'; type = 'Article'; bib = [ ...  
'author = {Lorenzo Moto}, ' ...
'year = {1996}, ' ...
'title = {Reproductive biology and fecundity of the {B}ay of {B}iscay anchovy population (\emph{Engraulis encrasicolus} {L}.)}, ' ... 
'journal = {Sci. Mar.}, ' ...
'volume = {60 (Supl. 2)}, '...
'pages = {195-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Engraulis-capensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
