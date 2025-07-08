function [data, auxData, metaData, txtData, weights] = mydata_Bufotes_viridis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Bufotes_viridis'; 
metaData.species_en = 'Ladakh toad'; 

metaData.ecoCode.climate = {'Csa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc','jiTf','jiTs','jiTd'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 26];

%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 106;    units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'guess';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '86 – 125 d';
data.tp = 2.5*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'KutrCaki2011';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2.5*365;    units.tpm = 'd';    label.tpm = 'time since metam at puberty for male';  bibkey.tpm = 'KutrCaki2011';
  temp.tpm = C2K(20);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'amphibiaweb';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.63;     units.Lj  = 'cm';  label.Lj  = 'SVL at metam';             bibkey.Lj  = 'KutrCaki2011';
data.Li  = 12;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'amphibiaweb';
data.Lim  = 10; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';     bibkey.Lim  = 'guess';
  comment.Lim = 'based on remark that males are somewhat smaller than females';

data.Wwb = 0.0042; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 167.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'KutrCaki2011';
  comment.Wwi = 'based on SVL 7.946 cm weighs 48.58 g: (12/7.946)^3*48.58';
data.Wwim = 94.57;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'KutrCaki2011';
  comment.Wwim = 'based on SVL 7.711 cm weighs 43.36 g: (10/7.711)^3*43.36';

data.Ri  = 8e3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'amphibiaweb';   
temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2e3-3e4 eggs per year'; 

% uni-variate data
% time-length
data.tL_fm = [ ... % time (yr), body length (cm): females, males
    1	NaN   6.55
    2	7.00  7.562
    3	8.80  7.00
    4	7.50  7.60
    5	6.90  7.50
    6	6.30  7.60
    8	6.60  NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.9) * 365; % convert yr to d since metam
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm    = C2K(20); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'AshkGhar2012'; treat.tL_fm = {1, {'females','males'}}; 
comment.tL_fm = 'Data for females, males';
%
data.tL1_f = [ ... % time (yr), body length (cm): females
1.670	6.014
2.551	7.663
2.574	6.250
2.586	6.087
2.597	6.975
2.597	6.612
2.597	6.540
3.420	8.297
3.432	8.243
3.432	8.062
3.432	7.899
3.432	7.772
3.432	6.576
4.290	8.207
4.301	9.004
5.125	8.750
5.125	8.551
5.125	8.388
6.006	8.931
6.006	8.768
6.841	8.822
7.930	8.678];
data.tL1_f(:,1) = (data.tL1_f(:,1)+0.9) * 365; % convert yr to d since metam
units.tL1_f   = {'d', 'cm'};  label.tL1_f = {'time since metam', 'SVL'};  
temp.tL1_f    = C2K(20); units.temp.tL1_f = 'K'; label.temp.tL1_f = 'temperature';
bibkey.tL1_f = 'KutrCaki2011'; 
comment.tL1_f = 'Data for females from Giresun Island';
%
data.tL1_m = [ ... % time (yr), body length (cm): females
2.551	7.500
2.562	6.395
3.397	7.609
3.409	7.065
4.278	8.587
5.113	7.391
5.136	7.880
5.217	6.051
7.930	8.062];
data.tL1_m(:,1) = (data.tL1_m(:,1)+0.9) * 365; % convert yr to d since metam
units.tL1_m   = {'d', 'cm'};  label.tL1_m = {'time since metam', 'SVL'};  
temp.tL1_m    = C2K(20); units.temp.tL1_m = 'K'; label.temp.tL1_m = 'temperature';
bibkey.tL1_m = 'KutrCaki2011'; 
comment.tL1_m = 'Data for males from Giresun Island';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1_f','tL1_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'NPMS'; % Cat of Life
metaData.links.id_ITIS = '1103405'; % ITIS
metaData.links.id_EoL = '62673872'; % Ency of Life
metaData.links.id_Wiki = 'Bufotes_viridis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5290256'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Bufotes+latastii'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bufotes_viridis}}';
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
bibkey = 'AshkGhar2012'; type = 'Article'; bib = [ ... 
'doi = {10.30906/1026-2296-2020-27-5-284-290}, ' ...
'author = {S. Ashkavandi and A. Gharzi and M. Abbassi}, ' ... 
'year = {2012}, ' ...
'title = {A Skeletochronological Estimation of Age Structure in A Population of the \emph{Bufo viridis} ({A}nuran: {A}mphibia) in Central {Z}agros {I}ran}, ' ...
'journal = {Asian J. Eexp. Biol. Sci.}, ' ...
'volume = {3(1)}, ' ...
'pages = {99-104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KutrCaki2011'; type = 'Article'; bib = [ ... 
'doi = {10.3923/javaa.2011.1469.1472}, ' ...
'author = {Kutrup, Bilal and Cakir, Emel and Colak, Zeliha and B\"{u}lb\"{u}l, Ufuk and Karaoglu, Handan}, ' ... 
'year = {2011}, ' ...
'title = {Age and growth of the green toad, \emph{Bufo viridis} ({L}aurenti, 1768) from an island and a mainland population in {G}iresun, {T}urkey}, ' ...
'journal = {J. Anim. Vet. Advances}, ' ...
'volume = {10(11)}, ' ...
'pages = {1469-1472}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/62673872/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Bufotes+viridis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
