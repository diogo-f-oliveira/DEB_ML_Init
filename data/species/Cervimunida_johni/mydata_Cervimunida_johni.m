function [data, auxData, metaData, txtData, weights] = mydata_Cervimunida_johni

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Munididae';
metaData.species    = 'Cervimunida_johni'; 
metaData.species_en = 'Yellow squat lobster'; 

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

data.tp = 1.8*365;   units.tp = 'd';   label.tp = 'time since metam at puberty for females';  bibkey.tp = 'KilaAcun2015';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;    units.am = 'd';   label.am = 'life span';                  bibkey.am = 'KilaAcun2015';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.976;     units.Lp  = 'cm'; label.Lp  = 'carapace length at puberty';   bibkey.Lp  = 'KilaAcun2015'; 
data.Li  = 3.5;    units.Li  = 'cm'; label.Li  = 'ultimate carapace length';     bibkey.Li  = 'KilaAcun2015';
data.Lim  = 4.2;    units.Lim  = 'cm'; label.Lim  = 'ultimate carapace length';     bibkey.Lim  = 'KilaAcun2015';

data.Wwb = 7e-4;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on egg diameter of 1.1 mm of Pandalus borealis: 4/3 * pi * 0.055^3';
data.Wwi  = 26.5;    units.Wwi  = 'g'; label.Wwi  = 'ultimate wet weight';     bibkey.Wwi  = 'KilaAcun2015';
  comment.Wwi = 'based on 0.002*(10*Li)^2.67, see F1';
  
data.Ri = 4500/365;    units.Ri = '#/d';   label.Ri = 'life span';                  bibkey.Ri = 'guess';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.9';

% uni-variate data
% time-length
data.tL_f = [ ... % time (yr) + 0.2 yr, carapace length (cm)
5.190	2.325
5.191	2.598
6.226	2.342
6.227	2.462
7.197	3.692
7.247	2.803
7.248	3.043
7.248	3.145
8.232	3.350
8.247	2.479
8.248	2.855
10.199	3.094
11.255	3.658];  
data.tL_f(:,1) = (data.tL_f(:,1) - 0.2) * 365; % convert yr to d since birth
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KilaAcun2015';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (yr), carapace length (cm)
2.009	2.120
2.010	2.359
2.010	2.444
2.537	2.462
2.994	2.615
2.995	2.752
3.028	2.154
4.031	2.615
4.032	2.786
4.034	3.624
4.524	3.060
5.034	3.265
5.036	3.641
5.037	4.103
5.983	3.094
5.985	3.778
5.985	3.897
5.987	4.615
5.988	4.769
6.004	4.530
6.969	4.034
6.970	4.205
7.006	4.513
8.021	3.231
8.024	4.308
9.992	4.393];  
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
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.002*(CL in mm)^2.67';
metaData.bibkey.F1 = 'KilaAcun2015'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '58820694'; % Ency of Life
metaData.links.id_Wiki = 'Cervimunida_johni'; % Wikipedia
metaData.links.id_Taxo = '1165187'; % Taxonomicon
metaData.links.id_WoRMS = '392199'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cervimunida_johni}}';
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
