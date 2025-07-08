function [data, auxData, metaData, txtData, weights] = mydata_Myrmecophaga_tridactyla

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Pilosa'; 
metaData.family     = 'Myrmecophagidae';
metaData.species    = 'Tamandua_mexicana'; 
metaData.species_en = 'Northern tamandua'; 
metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(32); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 12]; 

%% set data
% zero-variate data

data.tg = 163;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(32);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'EoL: polyestrous (130 till 150 d) or (160 till 190 d)';
data.tx = 56;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(32);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'EoL';
  temp.tp = C2K(32);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Wiki: 2.5-4 yr';
data.am = 16*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(32);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 290; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Cuar1987';
  comment.Wwb = 'based on back-extrapolation of tW data';
data.Wwi = 5000; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '2.3 till 5.4 kg; EoL 2 till 7 kg';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(32); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
   7  300
  70  744
  91  930
 203 3250
 273 4000];  
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(33);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Cuar1987';
comment.tW = 'Weights at 70 and 91 d were obtained from length/weight at 203 d';


%% set weights for all real data
weights = setweights(data, []);

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

%% Links
metaData.links.id_CoL = '54M4Y'; % Cat of Life
metaData.links.id_ITIS = '1090215'; % ITIS
metaData.links.id_EoL = '328524'; % Ency of Life
metaData.links.id_Wiki = 'Tamandua_mexicana'; % Wikipedia
metaData.links.id_ADW = 'Tamandua_mexicana'; % ADW
metaData.links.id_Taxo = '60514'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11800043'; % MSW3
metaData.links.id_AnAge = 'Tamandua_mexicana'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tamandua_mexicana}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tamandua_mexicana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cuar1987'; type = 'Article'; bib = [ ... 
'author = {A. D. Cuaron O.}, ' ... 
'year = {1987}, ' ...
'title = {Hand-rearing a {M}exican anteater \emph{Tamandua mexicana} at {Tuxtla Guti\''{e}rrez Zoo}}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {26}, ' ...
'pages = {255--260}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/328524/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

