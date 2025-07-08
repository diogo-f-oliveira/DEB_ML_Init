function [data, auxData, metaData, txtData, weights] = mydata_Paradoxurus_hermaphroditus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Viverridae';
metaData.species    = 'Paradoxurus_hermaphroditus'; 
metaData.species_en = 'Asian palm civet'; 

metaData.ecoCode.climate = {'A', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 02 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 02 01];              

%% set data
% zero-variate data

data.tg = 60;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 60;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 341;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 24.5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 88.65;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 730;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = {'ADW','AchaMoha1978'};
  comment.Wwx = 'based on tW data for tx';
data.Wwi = 3100;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3.4*2/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.4 pups per litter; 2 litters per yr';

% univariate data
tWWW = [ ... % time since birth (wk), weight (kg) of female, male, male pups
 0 0.098 0.092 0.093
 2 0.227 0.244 0.248
 4 0.390 0.417 0.400
 6 0.475 0.520 0.510
 8 0.725 0.750 0.725
10 0.865 0.880 0.895
12 1.008 0.970 1.020
14 1.198 1.067 1.187
16 1.240 1.120 1.280
18 1.225 1.000 1.260
20 1.465 1.235 1.545
22 1.658 1.430 1.592
24 1.455 1.480 1.587
26 1.420 1.680 1.560
28 1.480 1.805 1.780
30 1.652 1.880 1.970
32 1.605 1.800 1.940
34 1.880 2.010 2.250
36 2.005 2.200 2.485
38 2.190 2.280 2.525
40 2.555 2.295 2.550
42 2.265 2.285 2.540
44 2.265 2.305 2.520
46 2.280 2.325 2.560
48 2.505 2.380 2.585];
tWWW(:,1) = 7 * tWWW(:,1); % convert wk to d
tWWW(:,[2:4]) = 1e3 * tWWW(:,[2:4]); % convert kg to g
%
data.tW_f = tWWW(:,[1 2]);
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(17);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'AchaMoha1978';
comment.tW_f = 'Female pup in Nandankanan, Biological Park, Orissa';
%
data.tW_m1 = tWWW(:,[1 3]);
units.tW_m1   = {'d', 'g'};  label.tW_m1 = {'time since birth', 'weight', 'male'};  
temp.tW_m1    = C2K(17);  units.temp.tW_m1 = 'K'; label.temp.tW_m1 = 'temperature';
bibkey.tW_m1 = 'AchaMoha1978';
comment.tW_m1 = 'Male pup in Nandankanan, Biological Park, Orissa';
%
data.tW_m2 = tWWW(:,[1 4]);
units.tW_m2   = {'d', 'g'};  label.tW_m2 = {'time since birth', 'weight', 'male'};  
temp.tW_m2    = C2K(17);  units.temp.tW_m2 = 'K'; label.temp.tW_m2 = 'temperature';
bibkey.tW_m2 = 'AchaMoha1978';
comment.tW_m2 = 'Male pup in Nandankanan, Biological Park, Orissa';

%% set weights for all real data
weights = setweights(data, []);
%weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.2;
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m1','tW_m2'}; subtitle1 = {'Data for female, male, male pup'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '75P5H'; % Cat of Life
metaData.links.id_ITIS = '621985'; % ITIS
metaData.links.id_EoL = '328089'; % Ency of Life
metaData.links.id_Wiki = 'Paradoxurus_hermaphroditus'; % Wikipedia
metaData.links.id_ADW = 'Paradoxurus_hermaphroditus'; % ADW
metaData.links.id_Taxo = '66914'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000317'; % MSW3
metaData.links.id_AnAge = 'Paradoxurus_hermaphroditus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paradoxurus_hermaphroditus}}';
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
bibkey = 'AchaMoha1978'; type = 'Article'; bib = [ ...  
'author = {Acharjyo, L. N. and Mohapatra, S.}, ' ...
'year = {1978}, ' ...
'title  = {Birth and growth of common palm civet (\emph{Paradoxurus hermaphroditus}) in captivity}, ' ...
'volume = {75}, ' ...
'pages = {204--206}, ' ...
'Journal = {Journal of the Bombay Natural History Society}, ' ...
'howpublished = {\url{https://ia601305.us.archive.org/1/items/journalofbombay751978bomb/journalofbombay751978bomb.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Paradoxurus_hermaphroditus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Paradoxurus_hermaphroditus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

