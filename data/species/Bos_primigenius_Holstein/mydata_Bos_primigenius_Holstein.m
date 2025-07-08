function [data, auxData, metaData, txtData, weights] = mydata_Bos_primigenius_Holstein

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Bos_primigenius_Holstein'; 
metaData.species_en = 'Holstein cattle'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'JLi'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Paulus Schuckink Kool','Bas Kooijman'};    
metaData.date_subm = [2012 08 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 14];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 12 20];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 04 13];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 277;  units.tg = 'd';    label.tg = 'age at birth for females';    bibkey.tg = 'BeltButt1992';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 54;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'BeltButt1992';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 284;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'BeltButt1992';
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 343; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'BeltButt1992';
  temp.tpm = C2K(39);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'BeltButt1992';   
  temp.am = C2K(39);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 44.9e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BeltButt1992';
data.Wwx = 69.8e3; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning for females'; bibkey.Wwx = 'BeltButt1992';
data.Wwp = 241e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'BeltButt1992';
data.Wwpm = 288e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = 'BeltButt1992';
data.Wwi = 680e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'BeltButt1992';
data.Wwim = 1044e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'BeltButt1992';

data.Ri  = 1/(data.tg + 78); units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'BeltButt1992';   
  temp.Ri = C2K(39); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.JXL  = 29010; units.JXL  = 'g/d'; label.JXL  = 'milkproduction';           bibkey.JXL  = 'BeltButt1992';   
  temp.JXL = C2K(39); units.temp.JXL = 'K'; label.temp.JXL = 'temperature';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (mnth), wet weight (kg)
    0  53.1
    1  77.2
    2  96.1
    3 118.5
    4 141.3
    5 168.1
    6 191.0
    7 214.9
    8 243.2
    9 265.5
   10 286.6
   11 308.6
   12 332.5
   13 358.9
   14 380.7
   15 409.3
   16 427.3
   17 443.7
   18 458.2
   19 477.7
   20 493.6
   21 516.2
   22 523.4
   23 528.9];
data.tW_f(:,1) = (data.tW_f(:,1) + 0.5) * 30.5; % convert mnth to d
data.tW_f(:,2) = data.tW_f(:,2)*1e3; % convert kg to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(39);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'HeinLosi1998';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (kg)
182.5	218;
273.75	297;
365	    389;
456.25	479;
547.5	559;
638.75	638;
730	    711;
821.25	771;
912.5	817;
1003.75	868;
1095	905;
1186.25	930;
1277.5	946;
1368.75	977;
1460	996;
1551.25	1010;
1642.5	1021;
1733.75	1027;
1825	1014;
1916.25	1034;
2007.5	1058;
2190	1051;
2372.5	1071;
2555	1059;
2737.5	1069;
2920	1099];
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(39);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'CaloMcDo1973';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 10;
weights.tW_m = weights.tW_m * 10;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Milk digestion efficiency is very low, since milk production is much more than the calf consumes';     
D3 = 'Slow foetal development is assumed';     
D4 = 'mod_3: tWw_f data replaced, due to absence of proper reference';
D5 = 'mod_4: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Facts
F1 = 'milk composition: 2 kJ/g (on basis of wet weight); 3.5% protein, 17.6 kJ/g; 1.5% lipid, 38.8 kJ/g; 4.6% carbohydrate, 17.2 kJ/g; 0.7% mineral 0 kJ/g; 87.7% water 0   kJ/g. Weaning is artifial, farmer forced';
metaData.bibkey.F1 = 'Kooy2010'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5FZBB'; % Cat of Life
metaData.links.id_ITIS = '183845'; % ITIS
metaData.links.id_EoL = '10408207'; % Ency of Life
metaData.links.id_Wiki = 'Bos_primigenius'; % Wikipedia
metaData.links.id_ADW = 'Bos_taurus'; % ADW
metaData.links.id_Taxo = '167480'; % Taxonomicon
metaData.links.id_MSW3 = '14200690'; % Mammal Spec World
metaData.links.id_AnAge = 'Bos_taurus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bos_primigenius}}';
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
bibkey = 'BeltButt1992'; type = 'Article'; bib = [ ... 
'author = {Beltr\''{a}n, J. J. and  Butts, W. T. and Olson, T. A. and Koger, M.}, ' ... 
'year = {1992}, ' ...
'title = {Growth patterns of two lines of {A}ngus cattle selected using predicted growth parameters}, ' ...
'journal = {J Anim. Sci.}, ' ...
'volume = {70}, ' ...
'pages = {734--41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CaloMcDo1973'; type = 'Article'; bib = [ ... 
'author = {L. L. Calo and R . E. McDowell and L. D. VanVleck and P. D. Miller}, ' ... 
'year = {1973}, ' ...
'title = {Parameters of growth of {H}olstein-{F}riesian bulls}, ' ...
'journal = {J Anim. Sci.}, ' ...
'volume = {37(2)}, ' ...
'pages = {417-421}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeinLosi1998'; type = 'Article'; bib = [ ... 
'author = {A. J. Heinrichs and W. C. Losinger}, ' ... 
'year = {1998}, ' ...
'title = {Growth of {H}olstein Dairy Heifers in the {U}nited {S}tates}, ' ...
'journal = {J Anim. Sci.}, ' ...
'volume = {76}, ' ...
'pages = {1254-1260}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bos_taurus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
