function [data, auxData, metaData, txtData, weights] = mydata_Tylomys_nudicaudus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Tylomys_nudicaudus'; 
metaData.species_en = 'Peters''s climbing rat'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 01 02];              

%% set data
% zero-variate data

data.tg = 40;    units.tg = 'd';     label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 26;    units.tx = 'd';     label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 82;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 109;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 5.4*365;    units.am = 'd'; label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(35.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 16.77;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwx = 40;  units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 280;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'AnAge';

data.Ri  = 6*2.4/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.4 pups per litter; 6 litters per yr';
   
%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;

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
D2 = 'Body temperature is guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '59THJ'; % Cat of Life
metaData.links.id_ITIS = '633394'; % ITIS
metaData.links.id_EoL = '1180172'; % Ency of Life
metaData.links.id_Wiki = 'Tylomys_nudicaudus'; % Wikipedia
metaData.links.id_ADW = 'Tylomys_nudicaudus'; % ADW
metaData.links.id_Taxo = '88614'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000991'; % MSW3
metaData.links.id_AnAge = 'Tylomys_nudicaudus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tylomys_nudicaudus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tylomys_nudicaudus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

