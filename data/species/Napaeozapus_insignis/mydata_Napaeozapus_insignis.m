function [data, auxData, metaData, txtData, weights] = mydata_Napaeozapus_insignis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Dipodidae';
metaData.species    = 'Napaeozapus_insignis'; 
metaData.species_en = 'Woodland jumping mouse'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iFm'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 01 01];              

%% set data
% zero-variate data

data.tg = 29;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 36;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 256;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data is uncertain';

data.Wwb = 0.9;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 8.9;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 25;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1.3*4/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter; 1.3 litter per yr';

% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
  0  0.87
  6  1.6
 10  2.4
 14  3.9
 17  5.5
 19  6.0
 21  6.7
 24  7.9
 26  8.5];
units.tWw   = {'d', 'cm'};  label.tWw = {'time since birth', 'head-body length'};  
temp.tWw    = C2K(37);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'LaynHami1954';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;

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

%% Links
metaData.links.id_CoL = '45NLZ'; % Cat of Life
metaData.links.id_ITIS = '180390'; % ITIS
metaData.links.id_EoL = '328468'; % Ency of Life
metaData.links.id_Wiki = 'Napaeozapus_insignis'; % Wikipedia
metaData.links.id_ADW = 'Napaeozapus_insignis'; % ADW
metaData.links.id_Taxo = '63311'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12900081'; % MSW3
metaData.links.id_AnAge = 'Napaeozapus_insignis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Napaeozapus_insignis}}';
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
bibkey = 'LaynHami1954'; type = 'Article'; bib = [ ... 
'author = {James N. Layne and W. J. Hamilton}, ' ... 
'year = {1954}, ' ...
'title = {The Young of the Woodland Jumping Mouse, \emph{Napaeozapus insignis insignis} ({M}iller)}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {52(1)}, ' ...
'pages = {242-247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Napaeozapus_insignis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

