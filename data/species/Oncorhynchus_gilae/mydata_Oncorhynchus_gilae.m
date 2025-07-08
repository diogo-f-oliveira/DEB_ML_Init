function [data, auxData, metaData, txtData, weights] = mydata_Oncorhynchus_gilae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Oncorhynchus_gilae'; 
metaData.species_en = 'Gila trout'; 

metaData.ecoCode.climate = {'BSk','BWk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(9); 
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 16]; 


%% set data
% zero-variate data
  
  data.ab = 60;    units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'ADW';  
    temp.ab = C2K(9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  data.am = 4.5*365;    units.am = 'd';    label.am = 'life span';    bibkey.am = 'ADW';           
    temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
  data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'ADW';
  data.Li  = 23;  units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'ADW';
    comment.Li = 'Wiki gives 55 cm';
  
  data.Wwb = 0.0477;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';  
    comment.Wwb = 'based on egg diameter of 3-6 mm of O. mykiss: pi/6*0.45^3';
  data.Wwp = 31;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
    comment.Wwp = 'based on 0.00871*Lp^3.02, see F1';
  data.Wwi = 170;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'ADW';

  data.Ri  = 150/365;   units.Ri  = '#/d';   label.Ri  = 'max reproduction rate';  bibkey.Ri  = 'ADW';   
    temp.Ri = C2K(9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    comment.Ri = 'Wiki gives 686/365 and for hatcheries 150/365';

% Uni-variated data
% length-change in length
data.LdL = [ % ... % total length (cm), change in total length (cm/d)
12.5    4.2/244
17.5    2.4/244
22.5    1.5/244];
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'total length','change in total length'};  
temp.LdL    = C2K(9);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature'; 
bibkey.LdL = 'Rinn1982';
comment.LdL = 'Data for McKnight';

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
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00871*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'females spawn twice, males 3 times';
metaData.bibkey.F2 = 'ADW'; 
F3 = 'hybridizes with O. mykiss';
metaData.bibkey.F3 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '74MTS'; % Cat of Life
metaData.links.id_ITIS = '161985'; % ITIS
metaData.links.id_EoL = '213575'; % Ency of Life
metaData.links.id_Wiki = 'Oncorhynchus_gilae'; % Wikipedia
metaData.links.id_ADW = 'Oncorhynchus_gilae'; % ADW
metaData.links.id_Taxo = '181809'; % Taxonomicon
metaData.links.id_WoRMS = '1014244'; % WoRMS
metaData.links.id_fishbase = 'Oncorhynchus-gilae'; % fishbase


%% References%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Oncorhynchus_gilae}}';
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
bibkey = 'Rinn1982'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1982)2<150:MHRAGO>2.0.CO;2}, ' ...
'author = {John N. Rinne}, ' ... 
'year = {1982}, ' ...
'title = {Movement, Home Range, and Growth of a Rare Southwestern Trout in Improved and Unimproved Habitats}, ' ...
'journal = {North American Journal of Fisheries Management}, ' ...
'volume = {2(2)}, ' ...
'pages = {150-157}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Oncorhynchus-gilae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Oncorhynchus_gilae/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
