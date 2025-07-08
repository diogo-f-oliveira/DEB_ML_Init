function [data, auxData, metaData, txtData, weights] = mydata_Civettictis_civetta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Viverridae';
metaData.species    = 'Civettictis_civetta'; 
metaData.species_en = 'African civet'; 

metaData.ecoCode.climate = {'A', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 02 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1    = {'Bas Kooijman'};    
metaData.date_mod_1      = [2018 09 06];              
metaData.email_mod_1     = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'sta@akvaplan.niva.no'};            
metaData.date_acc  = [2018 08 06];              

%% set data
% zero-variate data

data.tg = 65;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 120;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 213;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36.7); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 28*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 380.5;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 1514;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 19e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Mall1973';

data.Ri  = 2.5*2.2/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 pups per litter; 2.2 litters per yr';

% univariate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
   4   680
   4   680
   4   792
  54  2250
  54  2270
  73  3170
  73  2830
  80  2940
  80  3170
  80  3620
 120  3620 
 120  4080
 120  4080
 129  3280
 173  6800
 212  8280
1109 15870
1830 20410
2041 17780];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(36.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Mall1973';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'mod_1: additional tW data; Wwi changed, Wwx ignored';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Links
metaData.links.id_CoL = 'VMQL'; % Cat of Life
metaData.links.id_ITIS = '621988'; % ITIS
metaData.links.id_EoL = '328092'; % Ency of Life
metaData.links.id_Wiki = 'Civettictis_civetta'; % Wikipedia
metaData.links.id_ADW = 'Civettictis_civetta'; % ADW
metaData.links.id_Taxo = '66880'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000378'; % MSW3
metaData.links.id_AnAge = 'Civettictis_civetta'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Civettictis_civetta}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Civettictis_civetta}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mall1973'; type = 'Article'; bib = [ ... 
'author = {Mallisoin, J. J. C.}, ' ... 
'doi = {10.1111/j.1748-1090.1973.tb02133.x}, ' ...
'year = {1973}, ' ...
'title = {The reproduction of the African civet \emph{Viverra civetta} at {J}ersey {Z}oo}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {13}, ' ...
'pages = {147-150}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
