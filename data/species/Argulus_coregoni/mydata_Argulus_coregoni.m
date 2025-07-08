function [data, auxData, metaData, txtData, weights] = mydata_Argulus_coregoni

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Ichthyostraca'; 
metaData.order      = 'Arguloida'; 
metaData.family     = 'Argulidae';
metaData.species    = 'Argulus_coregoni'; 
metaData.species_en = 'Salmon louse'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biTvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 03 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 03 12]; 

%% set data
% zero-variate data

data.ab = 17;        units.ab = 'd';      label.ab = 'age at birth';                   bibkey.ab = 'TaylSomm2005';   
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tj = 12;        units.tj = 'd';      label.tj = 'time since birth at metam';      bibkey.tj = 'PastMikh2004';   
  temp.tj = C2K(18); units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 38;        units.tp = 'd';      label.tp = 'time since birth at puberty';    bibkey.tp = 'PastMikh2004';   
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 60;        units.am = 'd';      label.am = 'life span';                      bibkey.am = 'TaylSomm2005';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Based on observation of absence of adults in winter';

data.Lb  = 0.07;     units.Lb  = 'cm';    label.Lb  = 'body length at birth';          bibkey.Lb  = 'TaylSomm2005';
data.Lj  = 0.2;      units.Lj  = 'cm';    label.Lj  = 'body length at metam';          bibkey.Lj  = 'PastMikh2004';
data.Lp  = 0.92;     units.Lp  = 'cm';    label.Lp  = 'body length at puberty';        bibkey.Lp  = 'PastMikh2004';
data.Li  = 1.3;      units.Li  = 'cm';    label.Li  = 'ultimate body length';          bibkey.Li  = 'PastMikh2004';
  comment.Li = 'Based on extrapolation of tL_f-data';

data.Wwb = 6.3e-6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'TaylSomm2005';
  comment.Wwb = 'Based on egg length of 300 mum and width of 200 mum: pi/6*0.03*0.02^2';
data.Wwi = 0.102;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'guess';
  comment.Wwi = 'Guess based in ovoid shape of length 1.3 cm, width 1.0 cm, height 0.1 cm: pi/4*1.3*1.0*0.1';

data.Ni  = 4000;     units.Ni  = '#';   label.Ni  = 'cumulated number of eggs';        bibkey.Ni  = 'TaylSomm2005';   
  temp.Ni = C2K(18); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '400 eggs/batch, upto 10 batches for A. japonicus';

% uni-variate data

% LdL-data
data.tL_f = [  ... % time since hatch (d), body length (cm)
 1	0.077
 6	0.117
11	0.197
16	0.341
21	0.516
26	0.714
31	0.917
36	1.007
41	1.096];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since hatch', 'body length', 'female'};  
temp.tL_f    = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PastMikh2004';
comment.tL_f = 'Data for females on Oncorhynchus mykiss';
%
data.tL_m = [  ... % time since hatch (d), body length (cm)
 1	0.086
 6	0.121
11	0.211
16	0.375
21	0.552
26	0.729
31	0.898
36	0.932
41	1.001];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since hatch', 'body length', 'male'};  
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'PastMikh2004';
comment.tL_m = 'Data for males on Oncorhynchus mykiss';
%
data.tL_fR = [  ... % time since hatch (d), body length (cm)
 1	0.076
 6	0.116
11	0.193
16	0.332
21	0.485
26	0.633
31	0.813
36	0.903
41	0.992];
units.tL_fR   = {'d', 'cm'};  label.tL_fR = {'time since hatch', 'body length', 'female'};  
temp.tL_fR    = C2K(18);  units.temp.tL_fR = 'K'; label.temp.tL_fR = 'temperature';
bibkey.tL_fR  = 'PastMikh2004';
comment.tL_fR = 'Data for females on Rutilus rutilus';
%
data.tL_mR = [  ... % time since hatch (d), body length (cm)
 1	0.082
 6	0.120
11	0.202
16	0.349
21	0.513
26	0.617
31	0.763
36	0.837
41	0.879];
units.tL_mR   = {'d', 'cm'};  label.tL_mR = {'time since hatch', 'body length', 'male'};  
temp.tL_mR    = C2K(18);  units.temp.tL_mR = 'K'; label.temp.tL_mR = 'temperature';
bibkey.tL_mR  = 'PastMikh2004';
comment.tL_mR = 'Data for males on Rutilus rutilus';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for female, male on Oncorhynchus'};
set2 = {'tL_fR','tL_mR'}; subtitle2 = {'Data for female, male on Rutilus'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Freshwater ectoparasite on salmonids';
metaData.bibkey.F1 = 'PastMikh2004'; 
F2 = '9 stages between hatch and adult, hatching as metanauplius; eggs in mats on firm surface, fully parasitic';
metaData.bibkey.F2 = 'TaylSomm2005'; 
F3 = 'Stages 1-5, the first maxilla is a strong hook for attachment, which transforms to a sucker in stage 6';
metaData.bibkey.F3 = 'TaylSomm2005'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '32PF'; % Cat of Life
metaData.links.id_ITIS = '89431'; % ITIS
metaData.links.id_EoL = '335530'; % Ency of Life
metaData.links.id_Wiki = 'Argulus'; % Wikipedia
metaData.links.id_ADW = 'Argulus_coregoni'; % ADW
metaData.links.id_Taxo = '33658'; % Taxonomicon
metaData.links.id_WoRMS = '357186'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Argulidae}}';
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
bibkey = 'PastMikh2004'; type = 'Article'; bib = [ ... 
'author = {A. Pasternak and V. Mikheev and E. T. Valtonen}, ' ... 
'year = {2004}, ' ...
'title = {Growth and development of Argulus coregoni (Crustacea: Branchiura) on salmonid and cyprinid hosts}, ' ...
'journal = {Dis Aquat Org}, ' ...
'volume = {58}, ' ...
'pages = {203-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PastMikh2000'; type = 'Article'; bib = [ ... 
'author = {A. Pasternak and V. Mikheev and E. T. Valtonen}, ' ... 
'year = {2000}, ' ...
'title = {Life history characteristics of Argulus foliaceus L. (Crustacea: Branchiura) populations in Central Finland}, ' ...
'journal = {Ann. Zool. Fennici}, ' ...
'volume = {37}, ' ...
'pages = {25-35}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TaylSomm2005'; type = 'Techreport'; bib = [ ... 
'author = {Taylor, N. G. H and Sommerville, C. and Wootten, R.}, ' ... 
'year = {2005}, ' ...
'title = {A review of Argulus spp. occurring in UK freshwaters}, ' ...
'institution = {Environment Agency, Rio House, Waterside Drive, Aztec West, Almondsbury, Bristol, BS32 4UD}, ' ...
'number = {Science Report SC990019/S}, ' ...
'pages = {1-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Argulus_foliaceus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

