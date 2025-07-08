function [data, auxData, metaData, txtData, weights] = mydata_Leontocebus_nigricollis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Callitrichidae';
metaData.species    = 'Leontocebus_nigricollis'; 
metaData.species_en = 'Black-mantled tamarin'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 27]; 


%% set data
% zero-variate data

data.tg = 140;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 82;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Wiki: 18 mnth';
data.tp = 850;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20.2*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 22.3;    units.Li  = 'cm';  label.Li  = 'ultimate body length';    bibkey.Li  = 'ADW';
  comment.Li = '22 to 22.6 cm';

data.Wwb = 43.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 480;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'ADW';
data.Wwim = 470;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'ADW';

data.Ri  = 1.8*1.4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(38.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.8 pups per litter, 1.4 litter per yr in the wild';

% univariate data
% time-weight
tWw = [ ... % time since birth (wk), weight (g)
    0  43
    1  47
    2  55
    3  63
    4  74
    5  85
    6  96
    7 109
    8 128
    9 137
   10 150
   11 162
   12 175
   13 194
   14 212
   15 217
   16 230];
tWw(:,1) = 7 * tWw(:,1); % convert wk to d
tWw_1 = [ ... % time since birth (mnth), weight (g)
    4 248
    5 275
    6 311
    7 329
    8 358
    9 360
   10 388
   11 404
   12 400];
tWw_1(:,1) = 30.5 * tWw_1(:,1); % convert mnth to d
data.tWw = [tWw; tWw_1];
units.tWw  = {'d', 'g/d'}; label.tWw = {'time sinc birth', 'wet weight'};  
temp.tWw   = C2K(38.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'ChasCoop1969';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 20 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '3T6RK'; % Cat of Life
metaData.links.id_ITIS = '998617'; % ITIS
metaData.links.id_EoL = '47049855'; % Ency of Life
metaData.links.id_Wiki = 'Leontocebus_nigricollis'; % Wikipedia
metaData.links.id_ADW = 'Saguinus_nigricollis'; % ADW
metaData.links.id_Taxo = '5467009'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100248'; % MSW3
metaData.links.id_AnAge = 'Leontocebus_nigricollis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leontocebus_nigricollis}}';
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
bibkey = 'ChasCoop1969'; type = 'Article'; bib = [ ... 
'author = {Chase, J. E. and Cooper, R. W.}, ' ... 
'year = {1969}, ' ...
'title = {\emph{Saguinus nigricollis}—physical growth and dental eruption in a small population of captive-barn individuals}, ' ...
'journal = {American Journal of Physical Anthropology}, ' ...
'volume = {30(1)}, ' ...
'doi = {10.1002/ajpa.1330300111}, '...
'pages = {111–116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Leontocebus_nigricollis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Saguinus_nigricollis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

