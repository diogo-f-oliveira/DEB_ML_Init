function [data, auxData, metaData, txtData, weights] = mydata_Heterocarpus_reedi

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Pandalidae';
metaData.species    = 'Heterocarpus_reedi'; 
metaData.species_en = 'Nylon shrimp';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
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

data.tp = 1.6*365;   units.tp = 'd';   label.tp = 'time since metam at puberty for females';  bibkey.tp = 'KilaAcun2015';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;    units.am = 'd';   label.am = 'life span';                  bibkey.am = 'KilaAcun2015';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.619; units.Lp  = 'cm'; label.Lp  = 'carapace length at puberty';   bibkey.Lp  = 'KilaAcun2015'; 
data.Li  = 3.6;   units.Li  = 'cm'; label.Li  = 'ultimate carapace length';     bibkey.Li  = 'KilaAcun2015';
data.Lim  = 3.8;  units.Lim  = 'cm'; label.Lim  = 'ultimate carapace length of male'; bibkey.Lim  = 'KilaAcun2015';

data.Wwb = 7e-4;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on egg diameter of 1.1 mm of Pandalus borealis: pi/6 * 0.11^3';
data.Wwi  = 32.6;    units.Wwi  = 'g'; label.Wwi  = 'ultimate wet weight';     bibkey.Wwi  = 'KilaAcun2015';
  comment.Wwi = 'based on 0.001*(10*Li)^2.90, see F1';

data.Ri = 6000/365;    units.Ri = '#/d';   label.Ri = 'life span';                  bibkey.Ri = 'guess';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.9';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time (yr) + 0.2 yr, carapace length (cm)
3.215	1.817
3.215	1.895
3.215	2.017
3.215	2.095
3.225	2.295
3.226	2.695
4.203	2.697
4.220	2.163
4.220	2.341
4.221	2.786
4.222	2.886
4.222	3.130
5.190	2.898
5.199	2.965
5.200	3.210];  
data.tL_f(:,1) = (data.tL_f(:,1) - 0.2) * 365; % convert yr to d since birth
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'females'};  
temp.tL_f    = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KilaAcun2015';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (yr), carapace length (cm)
1.996	2.159
1.996	2.215
1.996	2.293
2.993	3.006
3.002	3.039
3.002	3.072
3.010	2.383
3.010	2.539
3.010	2.594
4.007	3.141];  
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d since birth
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m   = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KilaAcun2015';
comment.tL_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Lim = 5 * weights.Lim;
weights.Ri = 0 * weights.Ri;

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
D1 = 'Males are assumped to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.001*(CL in mm)^2.90';
metaData.bibkey.F1 = 'KilaAcun2015'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9CRLQ'; % Cat of Life
metaData.links.id_ITIS = '97075'; % ITIS
metaData.links.id_EoL = '46516047'; % Ency of Life
metaData.links.id_Wiki = 'Heterocarpus_reedi'; % Wikipedia
metaData.links.id_ADW = 'Heterocarpus_reedi'; % ADW
metaData.links.id_Taxo = '410477'; % Taxonomicon
metaData.links.id_WoRMS = '241283'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Heterocarpus}}';
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
