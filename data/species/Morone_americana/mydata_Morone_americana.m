function [data, auxData, metaData, txtData, weights] = mydata_Morone_americana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Moroniformes'; 
metaData.family     = 'Moronidae';
metaData.species    = 'Morone_americana'; 
metaData.species_en = 'White perch'; 

metaData.ecoCode.climate = {'MC','Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'MANW','THn'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd','0iFe','0iFl'};
metaData.ecoCode.embryo  = {'Mp','Fp'};
metaData.ecoCode.migrate = {'Mo','Mp'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 04 29];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 16 * 365;  units.am = 'd';      label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(10.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 25;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess';  
data.Li  = 58;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.88 mm for  	Sillago robusta: pi/6*0.088^3';

data.Ri = 250e3/365;   units.Ri = 'g';  label.Ri = 'Reprod rate max rate';           bibkey.Ri = 'fishbase';
  temp.Ri = C2K(10.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.002	7.6494
2.039	11.8581
2.973	14.0466
3.988	15.5895
4.950	16.9705
6.019	18.7561
6.981	20.2583
7.997	21.4377
9.013	22.6172
10.028	24.5640];
data.tL_f(:,1) = 365 * (1.25 + data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(10.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'Krug1965';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.934	7.287
1.983	11.248
3.011	13.307
4.014	14.733
5.017	16.040
6.020	17.465
6.968	19.564
8.025	20.436
8.712	21.069];
data.tL_m(:,1) = 365 * (1.25 + data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(10.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'Krug1965';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), total length (cm)
1.018	22.304
1.981	50.548
3.051	103.690
3.988	123.102
5.005	155.368
5.995	191.642
6.958	237.543
7.999	321.980
9.065	443.339
10.109	469.991];
data.tW_f(:,1) = 365 * (1.25 + data.tW_f(:,1));
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(10.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'Krug1965';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), total length (cm)
0.997	19.048
1.990	44.444
2.955	73.413
3.970	107.937
4.985	141.270
5.930	158.333
6.973	189.286];
data.tW_m(:,1) = 365 * (1.25 + data.tW_m(:,1));
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(10.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'Krug1965';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;
weights.Li =  50 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';    
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00447*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6RRD2'; % Cat of Life
metaData.links.id_ITIS = '167678'; % ITIS
metaData.links.id_EoL = '46578727'; % Ency of Life
metaData.links.id_Wiki = 'Morone_americana'; % Wikipedia
metaData.links.id_ADW = 'Morone_americana'; % ADW
metaData.links.id_Taxo = '180398'; % Taxonomicon
metaData.links.id_WoRMS = '151177'; % WoRMS
metaData.links.id_fishbase = 'Morone-americana'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Morone_americana}}';
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
bibkey = 'Krug1965'; type = 'Article'; bib = [ ... 
'author = {Friedrich Kr\"{u}ger}, ' ... 
'year = {1965}, ' ...
'title = {Zur {M}athematik des tierischen {W}achstums {I}. {G}rundlagen einer neuen {W}achstumsfunktion}, ' ...
'journal = {Helgol\"{a}nder wiss. Meeresunters}, ' ...
'volume = {49}, ' ...
'pages = {78-136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Morone-americana.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

