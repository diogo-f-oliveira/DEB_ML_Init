function [data, auxData, metaData, txtData, weights] = mydata_Pleuroncodes_monodon

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Munididae';
metaData.species    = 'Pleuroncodes_monodon'; 
metaData.species_en = 'Red squat lobster'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb';'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 19]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 19]; 

%% set data
% zero-variate data

data.tp = 1.1*365;   units.tp = 'd';   label.tp = 'time since metam at puberty for females';  bibkey.tp = 'KilaAcun2015';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;    units.am = 'd';   label.am = 'life span';                  bibkey.am = 'guess';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.368;     units.Lp  = 'cm'; label.Lp  = 'carapace length at puberty';   bibkey.Lp  = 'KilaAcun2015'; 
data.Li  = 4.0;    units.Li  = 'cm'; label.Li  = 'ultimate carapace length';     bibkey.Li  = 'KilaAcun2015';
data.Lim  = 4.2;  units.Lim  = 'cm'; label.Lim  = 'ultimate carapace length of male'; bibkey.Lim  = 'KilaAcun2015';

data.Wwb = 7e-4;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on egg diameter of 1.1 mm of Pandalus borealis: 4/3 * pi * 0.055^3';
data.Wwi  = 33.2;    units.Wwi  = 'g'; label.Wwi  = 'ultimate wet weight';     bibkey.Wwi  = 'KilaAcun2015';
  comment.Wwi = 'based on 0.001*(10*Li)^2.822, see F1';
 
data.Ri = 8000/365;    units.Ri = '#/d';   label.Ri = 'life span';                  bibkey.Ri = 'guess';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.9';

% uni-variate data
% time-length
data.tL_f = [ ... % time (yr) + 0.2 yr, carapace length (cm)
2.175	2.270
2.184	2.368
2.211	2.925
3.193	3.064
3.202	2.298
3.202	2.396
3.211	3.301
3.211	3.565
3.211	3.621
4.184	2.953
4.184	3.997
4.211	3.106
4.211	3.245
4.211	3.593
4.211	3.733
4.702	3.022
5.219	3.997
5.219	4.081];  
data.tL_f(:,1) = (data.tL_f(:,1) - 0.2) * 365; % convert yr to d since birth
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KilaAcun2015';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (yr), carapace length (cm)
0.991	1.922
1.000	2.103
2.000	2.382
2.000	3.370
2.000	3.482
2.009	2.493
2.009	2.869
2.009	2.981
3.009	3.468
3.009	3.830
3.009	4.053
3.026	2.827
3.026	2.981
4.000	2.939
4.000	3.329
4.000	3.565
4.000	3.760
4.000	3.997
4.000	4.109
4.000	4.443
4.009	4.304];  
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d since birth
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m   = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KilaAcun2015';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;
weights.Lim = 5 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.001*(CL in mm)^2.822';
metaData.bibkey.F1 = 'KilaAcun2015'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'B84TR'; % Cat of Life
metaData.links.id_ITIS = '1202077'; % ITIS
metaData.links.id_EoL = '55039819'; % Ency of Life
metaData.links.id_Wiki = 'Pleuroncodes_monodon'; % Wikipedia
metaData.links.id_ADW = 'Pleuroncodes'; % ADW
metaData.links.id_Taxo = '33945'; % Taxonomicon
metaData.links.id_WoRMS = '392682'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pleuroncodes_monodon}}';
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
bibkey = 'KilaAcun2015'; type = 'Article'; bib = [ ... 
'author = {Raouf Kilada and Enzo Acuna}, ' ... 
'year = {2015}, ' ...
'title = {Direct age determination by growth band counts of three commercially important crustacean species in {C}hile}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {170}, ' ...
'pages = {134-143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
