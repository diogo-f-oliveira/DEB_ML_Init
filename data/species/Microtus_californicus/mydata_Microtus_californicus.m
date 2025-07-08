function [data, auxData, metaData, txtData, weights] = mydata_Microtus_californicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Microtus_californicus'; 
metaData.species_en = 'California vole'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 04]; 

%% set data
% zero-variate data

data.tg = 22.2;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 14;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 25;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'ADW';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    
data.Wwb = 2.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
data.Wwi = 38;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';
  comment.Wwi = '38-108 g';

data.Ri  = 10*4.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10 litters per yr, 4.5 pups per litter';

% uni-variate data

% time-weight
data.tWw = [ ... % time since birth (mnth), weight (g)
    1  2.8
    2  3.6
    3  4.6
    4  5.6
    5  6.8
    6  7.6
    7  8.6
    8  9.9
    9 10.6
   10 11.4
   11 12.3
   12 13.1
   13 13.9
   14 14.8
   15 15.7
   16 16.0
   17 16.9
   18 17.9
   19 18.7
   20 19.4
   21 19.8 
   22 20.3
   23 20.8
   24 21.3
   25 21.8
   26 23.3
   27 23.6
   28 24.1
   29 24.7
   30 25.5
   31 26.2
   32 26.8
   33 27.2
   34 28.1 
   35 28.7
   36 29.0
   37 28.8
   38 29.1
   39 29.1
   40 29.7
   41 30.4
   42 31.1
   43 31.4
   44 31.7
   45 32.5
   46 33.0
   47 33.3
   48 33.4
   49 33.5
   50 33.6];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(37.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Hatf1935';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females due to lack of data, but males become somewhat heavier';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4399K'; % Cat of Life
metaData.links.id_ITIS = '180305 '; % ITIS
metaData.links.id_EoL = '310277'; % Ency of Life
metaData.links.id_Wiki = 'Microtus_californicus'; % Wikipedia
metaData.links.id_ADW = 'Microtus_californicus'; % ADW
metaData.links.id_Taxo = '62683'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000253'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microtus_californicus}}';
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
bibkey = 'Hatf1935'; type = 'Article'; bib = [ ... 
'author = {Donald M. Hatfield}, ' ... 
'year = {1935}, ' ...
'title = {A Natural History Study of mph{Microtus Californicus}}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {16(4)}, ' ...
'pages = {261-271}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Microtus_californicus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

