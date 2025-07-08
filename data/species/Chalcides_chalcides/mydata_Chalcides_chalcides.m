function [data, auxData, metaData, txtData, weights] = mydata_Chalcides_chalcides

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Chalcides_chalcides';
metaData.species_en = 'Three-toed skink';

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 05 16];
metaData.email    = {'bas.kooijman@vu.nl'};
metaData.address  = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data;
data.am = 4*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'Guar2010';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 4.6;     units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Guar2010';
data.Lp  = 13;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'Guar2010';
  comment.Lp = 'SVL 111-150 mm';
data.Lpm  = 9.8;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'Guar2010';
  comment.Lpm = 'SVL 91-106 mm';
data.Li  = 18; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Guar2010';
  comment.Li = 'TL 48 cm';
data.Lim  = 13; units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Guar2010';

data.Wwi = 42.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on photo: body diameter 1.3 cm, SVL 18 cm, tail 20 cm: pi/4*1.3^2*32;  Wiki gives 39 g for Chalcides ocellatus of TL 30 cm, but this species is less slender';

data.Ri  = 9/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Rugi1997';
temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time -  length data
data.tL_f = [ ... % age (month),  SVL (cm)
0.404	4.950
11.212	10.297
11.313	9.533
21.162	13.416
21.212	12.430
22.172	15.581
23.131	15.708
23.182	14.753
25.152	14.690
31.061	15.549
31.162	14.849
33.030	15.963
35.152	16.377
35.152	16.027
43.030	16.472
46.111	17.363];
data.tL_f(:,1) = data.tL_f(:,1) * 30.5; % convert mnth to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Guar2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % age (month),  SVL (cm)
0.202	4.599
0.253	4.854
1.110	6.032
1.111	5.873
1.112	5.650
8.030	7.782
8.031	7.114
9.091	10.074
9.141	6.605
9.242	6.891
11.061	9.788
19.091	10.615
20.960	12.016
20.961	11.729
20.962	11.411
21.162	10.966
23.030	11.507
32.071	11.411
32.072	11.793
32.172	12.080];
data.tL_m(:,1) = data.tL_m(:,1) * 30.5; % convert mnth to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Guar2010';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Li = 10 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

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
D1 = 'Males are supposed to differ from females by {p_Am}and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Viviparous, with complex placenta';
metaData.bibkey.F1 = 'reptileDB'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TFQH'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '47364720'; % Ency of Life
metaData.links.id_Wiki = 'Chalcides_chalcides'; % Wikipedia
metaData.links.id_ADW = 'Chalcides_chalcides'; % ADW
metaData.links.id_Taxo = '49398'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Chalcides&species=chalcides'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chalcides_chalcides}}';   
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
bibkey = 'Guar2010'; type = 'Article'; bib = [ ...  
'author = {Fabio Maria Guarino}, ' ...
'title = {Structure of the femora and autotomous(postpygal)caudal vertebrae in the three-toed skink \emph{Chalcides chalcides} ({R}eptilia: {S}quamata: {S}cincidae) and its applicability for age and growth rate determination}, ' ...
'journal = {Zoologischer Anzeiger}, ' ...
'volume = {248}, ' ...
'pages = {273-283}, ' ...
'year = {2010}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rugi1997'; type = 'Article'; bib = [ ...  
'author = {Lorenzo Rugiero}, ' ...
'title = {On the ecology and phenology of \emph{Chalcides chalcides} ({L}innaeus, 1758) in Central {I}taly}, ' ...
'journal = {Herpetozoa}, ' ...
'volume = {10}, ' ...
'pages = {81-84}, ' ...
'year = {1997}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'reptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reptile-database.reptarium.cz/species?genus=Chalcides&species=chalcides}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

