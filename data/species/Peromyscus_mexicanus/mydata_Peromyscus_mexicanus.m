function [data, auxData, metaData, txtData, weights] = mydata_Peromyscus_mexicanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Peromyscus_mexicanus'; 
metaData.species_en = 'Mexican deer mouse'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 14];              

%% set data
% zero-variate data

data.tg = 35;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Rick1977';   
  temp.tg = C2K(36.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 25;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Rick1977';   
  temp.tx = C2K(36.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 66.5;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Rick1977';
  temp.tp = C2K(36.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '43-73 d';
data.am = 15*30.5;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 4.4;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Rick1977';
data.Wwi = 46;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';

data.Ri  = 2.1*2/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = {'Rick1977','Wiki'};   
  temp.Ri = C2K(36.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.1 pups per litter; 2 litters per yr';
   
% univariate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
    0  4.4
    6  8.4
   14 14.8
   20 19.0
   28 25.8
   34 32.4
   41 36.7
   48 41.1
   55 45.3
   62 47.5
   69 51.7
   76 54.7
   83 56.5
   90 58.2
   97 60.5];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(36.6);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'Rick1977';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumend to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4F7KZ'; % Cat of Life
metaData.links.id_ITIS = '633283'; % ITIS
metaData.links.id_EoL = '1180061'; % Ency of Life
metaData.links.id_Wiki = 'Peromyscus_mexicanus'; % Wikipedia
metaData.links.id_ADW = 'Peromyscus_mexicanus'; % ADW
metaData.links.id_Taxo = '62385'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000473'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Peromyscus_mexicanus}}';
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
bibkey = 'Rick1977'; type = 'Article'; bib = [ ... 
'author = {Rickart, E. A.}, ' ... 
'year = {1977}, ' ...
'title = {Reproduction, growth and development in two species of cloud-forest \emph{Peromyscus} from southern {M}exico}, ' ...
'journal = {Occasional Papers Museum Nat. Hist., Univ. Kansas}, ' ...
'volume = {67}, ' ...
'pages = {1-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

