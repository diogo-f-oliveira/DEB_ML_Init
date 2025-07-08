function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_erythracanthus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_erythracanthus'; 
metaData.species_en = 'Orange-spotted emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPE'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 17];

%% set data
% zero-variate data

data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 25; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 70; units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.335 mm : pi/6*0.0335^3'; 
data.Wwp = 241;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01445*Lp^3.02, see F1';
data.Wwi = 5.4e3;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01445*Li^3.02, see F1';

data.Ri  = 374e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   comment.Ri = 'based on Lethrinus_enigmaticus: 166200*5.4e3/2.4e3';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
1.013	19.087
1.078	17.925
1.111	16.598
1.144	13.444
1.895	20.581
2.974	22.407
3.007	23.734
3.072	21.411
4.085	25.062
6.078	33.859
10.000	38.174];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(27.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FryBrew2006'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01445*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'probably protogynous hermaphrodite, like Lethrinus mahsena';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Marine; reef-associated; depth range 2 - 100 m. Tropical';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6Q2P7'; % Cat of Life
metaData.links.id_ITIS = '550903'; % ITIS
metaData.links.id_EoL = '46580942'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_erythracanthus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_erythracanthus'; % ADW
metaData.links.id_Taxo = '178736'; % Taxonomicon
metaData.links.id_WoRMS = '212066'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-erythracanthus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_erythracanthus}}';
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
bibkey = 'FryBrew2006'; type = 'article'; bib = [ ...
'doi = {10.1016/j.fishres.2006.08.002}, ' ...
'author = {Fry, G.C. and D.T. Brewer and W.N. Venables}, ' ...
'year = {2006}, ' ...
'title = {Vulnerability of deepwater demersal fishes to commercial fishing: {E}vidence from a study around a tropical volcanic seamount in {P}apua {N}ew {G}uinea}, ' ... 
'journal = {Fish. Res.}, ' ...
'volume = {81}, '...
'pages = {126-141}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-erythracanthus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
