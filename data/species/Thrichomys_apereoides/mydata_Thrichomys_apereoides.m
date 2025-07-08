function [data, auxData, metaData, txtData, weights] = mydata_Thrichomys_apereoides
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Echimyidae';
metaData.species    = 'Thrichomys_apereoides'; 
metaData.species_en = 'Common punare'; 

metaData.ecoCode.climate = {'Aw','BSh'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 12];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 12];              

%% set data
% zero-variate data

data.tg = 94;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 46;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 178;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(34.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Data for Dipodomys ordii';
data.am = 7*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 21.1;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'RobeThom1988';
data.Wwx = 58.4;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'TeixRoqu2005';
data.Wwi = 373.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2.5*3.1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.1 pups per litter; 2.5 litters per yr';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 3 * weights.Wwx;

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
D1 = 'Body temperature of Perognathus longimembris';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '56LSZ'; % Cat of Life
metaData.links.id_ITIS = '584860'; % ITIS
metaData.links.id_EoL = '327152'; % Ency of Life
metaData.links.id_Wiki = 'Thrichomys_apereoides'; % Wikipedia
metaData.links.id_ADW = 'Thrichomys_apereoides'; % ADW
metaData.links.id_Taxo = '63596'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400520'; % MSW3
metaData.links.id_AnAge = 'Thrichomys_apereoides'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thrichomys_apereoides}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Thrichomys_apereoides}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RobeThom1988'; type = 'Article'; bib = [ ...  
'author = {Miles S. Roberts and Katerina V. Thompson and Jack A. Cranford}, ' ...
'year = {1988}, ' ...
'title  = {Reproduction and Growth in Captive Punare (\emph{Thrichomys apereoides} {R}odentia: {E}chimyidae) of the {B}razilian {C}aatinga with Reference to the Reproductive Strategies of the {E}chimyidae}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {69(3)}, ' ...
'pages = {542-551}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TeixRoqu2005'; type = 'Article'; bib = [ ...  
'author = {Bernardo Rodrigues Teixeira and Andr\''{e} Luiz R. Roque and Simone Cristina Barreiros-G\''{o}mez and Pavel Mikhailovitch Borodin and Ana Maria Jansen and Paulo S\''{e}rgio D''Andrea}, ' ...
'year = {2005}, ' ...
'title  = {Maintenance and breeding of Thrichomys (Trouessart, 1880) (Rodentia: Echimyidae) in captivity}, ' ...
'journal = {Mem Inst Oswaldo Cruz, Rio de \^{i}}, ' ...
'volume = {100(6)}, ' ...
'pages = {527-530}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

