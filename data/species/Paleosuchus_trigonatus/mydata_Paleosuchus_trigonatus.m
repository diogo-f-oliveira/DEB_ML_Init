function [data, auxData, metaData, txtData, weights] = mydata_Paleosuchus_trigonatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Alligatoridae';
metaData.species    = 'Paleosuchus_trigonatus'; 
metaData.species_en = 'Smooth-fronted caiman'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFm', 'biFr'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvr', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

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

data.ab = 115;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Wiki';   
  temp.ab = C2K(31.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 11*365;     units.tp = 'd';    label.tp = 'time since age at puberty for female';  bibkey.tp = 'Wiki';
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 40*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 130;      units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for female'; bibkey.Lp  = 'ADW'; 
data.Lpm  = 140;      units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for male'; bibkey.Lpm  = 'ADW'; 
data.Li  = 140;      units.Li  = 'cm';  label.Li  = 'ultimate total length for female';   bibkey.Li  = 'Wiki';
data.Lim = 230;      units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for male';    bibkey.Lim  = 'Wiki';

data.Wwb = 50;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'crocodilian';
data.Wwi = 20e3;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = 'Wiki';
data.Wwim = 36e3;    units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 12/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10 to 15 eggs per clutch, 1 clutch per yr assumed';
 
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
12     90];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'crocodilian';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
 0.25  30
 0.5   35
 1     42
 2     53
 4     77
 8     94
20    118];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'crocodilian';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (g)
12   6100];
data.tW_f(:,1) = 365 * data.tW_f(:,1);
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f = C2K(23);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'crocodilian';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), wet weight (g)
 0.25  95
 0.5  150
 1    250
 2    570
 4   4000
 8   3600
20  11500];
data.tW_m(:,1) = 365 * data.tW_m(:,1);
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m = C2K(23);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'crocodilian';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.v = 3 * weights.psd.v;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'temperature effects sex of neonate: below  31C neonates are male, above 32C they are female';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4C47K'; % Cat of Life
metaData.links.id_ITIS = '551815'; % ITIS
metaData.links.id_EoL = '791225'; % Ency of Life
metaData.links.id_Wiki = 'Paleosuchus_trigonatus'; % Wikipedia
metaData.links.id_ADW = 'Paleosuchus_trigonatus'; % ADW
metaData.links.id_Taxo = '50625'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Paleosuchus&species=trigonatus'; % ReptileDB
metaData.links.id_AnAge = 'Paleosuchus_trigonatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paleosuchus_trigonatus}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Paleosuchus_trigonatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Paleosuchus_trigonatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'crocodilian'; type = 'Misc'; bib = ...
'howpublished = {\url{http://crocodilian.com/paleosuchus/captivecare.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

