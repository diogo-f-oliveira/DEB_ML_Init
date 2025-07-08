function [data, auxData, metaData, txtData, weights] = mydata_Protopterus_aethiopicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Sarcopterygii'; 
metaData.order      = 'Lepidosireniformes'; 
metaData.family     = 'Protopteridae';
metaData.species    = 'Protopterus_aethiopicus'; 
metaData.species_en = 'Marbled lungfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0pFm', '0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii', 'jiCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = { 'ap'; 'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'Ww-Ww'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 02 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 16];


%% set data
% zero-variate data

data.tp = 3 * 365;  units.tp = 'd';       label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(27.5);     units.temp.tp = 'K';    label.temp.tp = 'temperature';
data.am = 18 * 365;  units.am = 'd';       label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(27.5);     units.temp.am = 'K';    label.temp.am = 'temperature'; 

data.Lp  = 73;     units.Lp  = 'cm';     label.Lp  = 'total length at puberty for female'; bibkey.Lp  = 'fishbase'; 
data.Li  = 200;      units.Li  = 'cm';     label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 0.0224;  units.Wwb = 'g';      label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'britannica';
  comment.Wwb = 'based on egg diameter of 3.5 to 4 mm: pi/6*0.35^3';
data.Wwp = 827;    units.Wwp = 'g';      label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi: (73/200)^3*17e3';
data.Wwi = 17000;    units.Wwi = 'g';      label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 5.84e4/365;  units.Ri  = '#/d';    label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.5);     units.temp.Ri = 'K';    label.temp.Ri = 'temperature';
 
% uni-variate data

% weight-weight data
data.WW = [ ... % intitial weight (g), recapture weight (g), interval (d)
 600  650  20
 760  900  56
1300 1480  64
1320 1460  50
1600 1840  65
2740 2860  48
2120 5720 871];
time.WW = data.WW(:,3); units.time.WW = 'd';    label.time.WW = 'recapture time'; 
data.WW = data.WW(:,1:2);
units.WW  = {'g', 'g'};  label.WW = {'initial weight', 'recapture weight'};  
temp.WW  = C2K(27.5);  units.temp.WW = 'K'; label.temp.WW = 'temperature';
treat.WW = {0}; units.treat.WW = ''; label.treat.WW = '';
bibkey.WW = 'DunbGree2006';

%% set weights for all real data
weights = setweights(data, []);
weights.WW = 5 * weights.WW;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.time = time;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4N6QX'; % Cat of Life
metaData.links.id_ITIS = '649771'; % ITIS
metaData.links.id_EoL = '214853'; % Ency of Life
metaData.links.id_Wiki = 'Protopterus_aethiopicus'; % Wikipedia
metaData.links.id_ADW = 'Protopterus_aethiopicus'; % ADW
metaData.links.id_Taxo = '42346'; % Taxonomicon
metaData.links.id_WoRMS = '1021560'; % WoRMS
metaData.links.id_fishbase = 'Protopterus-aethiopicus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Protopterus_aethiopicus}}';
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
bibkey = 'DunbGree2006'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1095-8649.2006.00906.x}, ' ...
'author = {R. Dunbrack and J. M. Green and C. M. Mlewa}, ' ... 
'year = {2006}, ' ...
'title = {Marbled lungfish growth rates in {L}ake {B}aringo, {K}enya, estimated by mark-recapture}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {68}, ' ...
'pages = {443-449}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Protopterus-aethiopicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'britannica'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.britannica.com/animal/lungfish}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Protopterus_annectens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

