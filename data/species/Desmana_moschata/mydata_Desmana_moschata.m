function [data, auxData, metaData, txtData, weights] = mydata_Desmana_moschata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Talpidae';
metaData.species    = 'Desmana_moschata'; 
metaData.species_en = 'Russian desman'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 07 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 07 24]; 

%% set data
% zero-variate data

data.tg = 47.5;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'sc51orel';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '45-50 d';
data.tx = 30;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'sc51orel';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 10.5*30.5;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'sc51orel';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'sc51orel';
data.Wwx = 265;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'guess';
  comment.tx = 'based on size-corrected Talpa europaea: 52.1*470/92.5';
data.Wwi = 470;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'sc51orel';
  comment.Wwi = '380-520 g';

data.Ri  = 4*2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'sc51orel';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-5 pups per litter, 2 litters per yr';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'body temperature based on Talpa europaea';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '34ZW4'; % Cat of Life
metaData.links.id_ITIS = '633829'; % ITIS
metaData.links.id_EoL = '1178965'; % Ency of Life
metaData.links.id_Wiki = 'Desmana_moschata'; % Wikipedia
metaData.links.id_ADW = 'Desmana_moschata'; % ADW
metaData.links.id_Taxo = '61304'; % Taxonomicon
metaData.links.id_WoRMS = '1506657'; % WoRMS
metaData.links.id_MSW3 = '13700678'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Desmana_moschata}}';
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
bibkey = 'sc51orel'; type = 'Misc'; bib = ...
'howpublished = {\url{https://sc51orel.ru/en/biologicheskaya-sistematika/report-on-the-russian-muskrat-russian-muskrat-contemporary-mammoth.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1178966/data}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

