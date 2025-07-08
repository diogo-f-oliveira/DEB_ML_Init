function [data, auxData, metaData, txtData, weights] = mydata_Hydrochoerus_hydrochaeris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Caviidae';
metaData.species    = 'Hydrochoerus_hydrochaeris'; 
metaData.species_en = 'Capybara'; 

metaData.ecoCode.climate = {'A', 'Cfa', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr', '0iFm', '0iFl', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 10 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Starrlight Augustine'};    
metaData.date_mod_3 = [2016 11 14];              
metaData.email_mod_3    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address_mod_3  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 11 14]; 



%% set data
% zero-variate data

data.tg = 140;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(37.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from AnAge; Wiki: 130-150 d';
data.tx = 16;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'library';   
  temp.tx = C2K(37.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 18*30.5; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'library';
  temp.tp = C2K(37.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '7-12 months for females, 15-24 months for males';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 120;   units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'Wiki';
  comment.Li = '107-134';

data.Wwb = 1.5e3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'library';
data.Wwp = 40e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'library';
data.Wwi = 91e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';
data.Wwim = 73.5e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';

data.Ri  = 2*4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(37.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
tW = [ ... % time since birth (date), wet weight (pound)
2007 07 10  1.50
2007 07 21  3.00
2007 07 29  3.78
2007 08 03  4.36
2007 08 07  4.78
2007 08 13  5.14
2007 08 16  5.58
2007 08 19  6.04
2007 08 22  6.56
2007 08 25  6.88
2007 08 29  7.48
2007 09 04  8.04
2007 09 07  8.74
2007 09 10  9.50
2007 09 13 10.20
2007 09 16 10.85
2007 09 19 11.38
2007 09 23 12.14
2007 09 27 13.36
2007 09 30 13.80
2007 10 04 14.50
2007 10 07 15.34
2007 10 11 15.84
2007 10 14 16.80
2007 10 17 17.35
2007 10 21 18.50
2007 10 25 19.10
2007 10 31 20.35
2007 11 09 22.60
2007 11 18 24.80
2007 11 25 26.70
2007 12 02 29.00
2007 12 09 30.70
2007 12 16 32.90
2007 12 23 35.00
2008 01 01 38.00
2008 01 10 39.80
2008 01 20 42.50
2008 02 01 44.50
2008 02 19 47.80
2008 03 06 51.75
2008 03 27 54.10
2008 04 11 60.30
2008 04 19 63.50
2008 05 03 67.50
2008 05 25 72.50
2008 06 10 75.00
2008 06 28 78.50
2008 07 10 81.00
2008 07 19 82.50
2008 08 08 86.00
2008 08 20 89.00
2008 09 01 89.50
2008 09 18 92.00
2008 10 05 93.50
2008 10 21 95.50
2008 11 15 97.00];
t = datenum(tW(:,1:3)); t = t - t(1); % d, convert to time since birth
W = tW(:,4) * 453.59237; % g, convert pound to g
data.tW = [t, W]; % d, g
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'gianthamster';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6MK7J'; % Cat of Life
metaData.links.id_ITIS = '825303'; % ITIS
metaData.links.id_EoL = '326517'; % Ency of Life
metaData.links.id_Wiki = 'Hydrochoerus_hydrochaeris'; % Wikipedia
metaData.links.id_ADW = 'Hydrochoerus_hydrochaeris'; % ADW
metaData.links.id_Taxo = '647819'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400218'; % MSW3
metaData.links.id_AnAge = 'Hydrochoerus_hydrochaeris'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hydrochoerus_hydrochaeris}}';
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
bibkey = 'gianthamster'; type = 'Misc'; bib = ...
'howpublished = {\url{http://gianthamster.com/tag/growth/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hydrochoerus_hydrochaeris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'library'; type = 'Misc'; bib = ...
'howpublished = {\url{http://library.sandiegozoo.org/factsheets/capybara/capybara.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

