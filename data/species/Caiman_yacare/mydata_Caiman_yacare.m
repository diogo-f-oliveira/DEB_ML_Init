function [data, auxData, metaData, txtData, weights] = mydata_Caiman_yacare
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Alligatoridae';
metaData.species    = 'Caiman_yacare'; 
metaData.species_en = 'Yacare caiman'; 

metaData.ecoCode.climate = {'Am','Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFc', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'bpCva', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 09 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.tp = 12.5*365;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';   
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '10-15 yrs';
data.am = 50*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 31.22;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'CampMour2014'; 
  comment.Lb = 'based on SVL 12.49 cm, converted from SVL using TL = SVL*200/80';
data.Lbm  = 32.10;     units.Lbm  = 'cm';  label.Lbm  = 'total length at birth for males'; bibkey.Lbm  = 'CampMour2014'; 
  comment.Lb = 'based on SVL 12.84 cm, converted from SVL using TL = SVL*200/80; probably larger than female because of temperature';
data.Lp  = 125;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'Wiki'; 
  comment.Lp = 'based on SVL 50 cm, converted from SVL using TL = SVL*200/80';
data.Lpm  = 125;     units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'Wiki'; 
  comment.Lpm = 'based on SVL 50 cm, converted from SVL using TL = SVL*200/80';
data.Li  = 140;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
data.Lim  = 300;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for male'; bibkey.Lim  = 'Wiki';

data.Wwb = 30;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on C. latirostris';
data.Wwi = 23e3;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = 'Wiki';
data.Wwim = 58e3;    units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 44/365;  units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23);units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '22-35 eggs per clutch is more common, 1 clutch per yr assumed';

% univariate data
% time-length
data.tL_f = [ ... time since birth (yr), SVL (cm)
0.060	14.085
0.061	13.615
0.062	12.207
1.455	29.343
2.568	44.836
2.716	34.507
2.717	33.333
9.571	76.995
9.855	73.239
12.590	79.812
15.678	85.446
16.521	84.742
16.733	83.099
17.783	88.732
21.651	83.333
22.848	80.047
23.830	82.160
24.812	84.507];
data.tL_f(:,1) = data.tL_f(:,1)*365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)*200/80; % convert SVL to TL
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f  = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CampMour2014';
comment.tL_f = 'Data for females; converted from SVL using TL = SVL*200/80';
%
data.tL_m = [ ... time since birth (yr), SVL (cm)
0.000	12.958
0.000	12.958
0.000	12.394
0.000	12.394
1.549	33.254
1.549	31.564
2.394	39.177
2.394	38.614
2.535	42.277
2.606	34.391
2.676	31.574
2.746	37.209
2.958	34.394
3.310	37.496
5.211	71.598
8.028	79.794
8.239	83.739
8.803	90.787
20.000	97.089
20.423	106.671
20.704	112.307
21.479	106.117
23.592	104.447];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)*200/80; % convert SVL to TL
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m  = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CampMour2014';
comment.tL_m = 'Data for males; converted from SVL using TL = SVL*200/80';

%% set weights for all real data
weights = setweights(data, []);
weights.Lp = 3 * weights.Lp;
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'temperature effects sex of neonate';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'PBBW'; % Cat of Life
metaData.links.id_ITIS = '202212'; % ITIS
metaData.links.id_EoL = '795539'; % Ency of Life
metaData.links.id_Wiki = 'Caiman_yacare'; % Wikipedia
metaData.links.id_ADW = 'Caiman_yacare'; % ADW
metaData.links.id_Taxo = '89971'; % Taxonomicon
metaData.links.id_WoRMS = '1478610'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Caiman&species=yacare'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Caiman_yacare}}';
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
bibkey = 'CampMour2014'; type = 'Article'; bib = [ ... 
'doi = {10.1371/journal.pone.0089363}, ' ...    
'author = {Zilca Campos and Guilherme Mour\~{a}o and Marcos Coutinho and William E. Magnusson}, ' ...
'title  = {Growth of \emph{Caiman crocodilus yacare} in the {B}razilian {P}antanal}, ' ...
'year = {2014}, ' ...
'journal = {PLOS one}, ' , ...
'pages = {e89363}, '...
'volume = {9(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

