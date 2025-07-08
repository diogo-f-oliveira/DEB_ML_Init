function [data, auxData, metaData, txtData, weights] = mydata_Tamiasciurus_hudsonicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Tamiasciurus_hudsonicus'; 
metaData.species_en = 'American red squirrel'; 

metaData.ecoCode.climate = {'BSk', 'Df'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 01 03]; 

%% set data
% zero-variate data

data.tg = 37;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 63;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 342;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9.8*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(38.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'AnAge';
data.Wwx = 83.8; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'AnAge';
data.Wwi = 200; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'AnAge';

data.Ri  = 4.2*1.7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.2 pups per litter; 1.7 litter per yr';

% uni-variate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
    42  51.1
    48  56.3
    55  62.3
    69  86.5
    76 103.6
    84 127.8
    91 130.1
    97 143.1
   104 149.3
   111 144.3
   118 153.7
   125 157.2];
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(38.7);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Layn1954';

%% set weights for all real data
weights = setweights(data, []);
%weights.Wwi = 5 * weights.Wwi;
%weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '54MTK'; % Cat of Life
metaData.links.id_ITIS = '180166'; % ITIS
metaData.links.id_EoL = '347433'; % Ency of Life
metaData.links.id_Wiki = 'Tamiasciurus_hudsonicus'; % Wikipedia
metaData.links.id_ADW = 'Tamiasciurus_hudsonicus'; % ADW
metaData.links.id_Taxo = '61734'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12400253'; % MSW3
metaData.links.id_AnAge = 'Tamiasciurus_hudsonicus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tamiasciurus_hudsonicus}}';
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
bibkey = 'Layn1954'; type = 'Article'; bib = [ ...  
'doi = {10.2307/1948465}, ' ...
'author = {Layne, J. N.}, ' ...
'year = {1954}, ' ...
'title  = {The Biology of the Red Squirrel, \emph{Tamiasciurus hudsonicus loquax} ({B}angs), in Central {N}ew {Y}ork}, ' ...
'journal = {Ecological Monographs}, ' ...
'volume = {24(3)}, ' ...
'pages = {227–268}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tamiasciurus_hudsonicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

