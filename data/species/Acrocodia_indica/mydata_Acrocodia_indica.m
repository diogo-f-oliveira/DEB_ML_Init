function [data, auxData, metaData, txtData, weights] = mydata_Acrocodia_indica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Perissodactyla'; 
metaData.family     = 'Tapiridae';
metaData.species    = 'Acrocodia_indica'; 
metaData.species_en = 'Malaysian tapir'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 24]; 

%% set data
% zero-variate data

data.tg = 392;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp 36.4-37.2 C, Klomburg 1995';
data.tx = 183;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1095;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 36.5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(36.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 6.8e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwi = 380e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Can weight up to 540 kg';

data.Ri  = 0.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (wk), wet weight (kg)
     2  14.2
     4  21.2
     6  28.4
     8  37
    10  45.7
    12  54.6
    14  67
    16  80.2
    18  90.2
    20  98.4
    22 108 
    24 118
    26 123
    28 131
    30 138
    32 146
    34 154
    36 161];
data.tW(:,1) = 7 * data.tW(:,1); % convert wk to d
units.tW   = {'d', 'kg'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DonnZain2017';
comment.tW = 'data for female';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1e-6;
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Females typically larger than males';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9LYL'; % Cat of Life
metaData.links.id_ITIS = '926161'; % ITIS
metaData.links.id_EoL = '129470'; % Ency of Life
metaData.links.id_Wiki = 'Acrocodia_indica'; % Wikipedia
metaData.links.id_ADW = 'Tapirus_indicus'; % ADW
metaData.links.id_Taxo = '5225816'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14100039'; % MSW3
metaData.links.id_AnAge = 'Acrocodia_indica'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tapirus_indicus}}';
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
bibkey = 'DonnZain2017'; type = 'Misc'; bib = [ ... 
'author = {Donny, Y. and Zainal, Z. Z. and J. J.Rovie-Ryan and Khairil, A.Z.A. and C. K. M. Zamzuri and Simaa, N. and A. S. Aminah and Zulfadli, Z. and Enos, J. and Halid, A. J. and Jamaludin, M. A. and S. Saaban}, ' ... 
'year = {2017}, ' ...
'title = {GROWTH CURVE and PELAGE COLOUR CHANGES OF A CAPTIVE BRED {M}ALAYAN TAPIR (\emph{Tapirus indicus})}, ' ...
'howpublished = {\url{https://www.researchgate.net/profile/Donny_Yawah/publication/315486192_Growth_Curve_Pelage_Colour_Changes_Of_A_Captive_Bred_Malayan_Tapir_Tapirus_Indicus/links/58d1e200a6fdcc3fe7852a1b/Growth-Curve-Pelage-Colour-Changes-Of-A-Captive-Bred-Malayan-Tapir-Tapirus-Indicus.pdf?origin=publication_detail}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Acrocodia_indica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

