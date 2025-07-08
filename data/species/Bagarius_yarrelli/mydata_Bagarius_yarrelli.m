  function [data, auxData, metaData, txtData, weights] = mydata_Bagarius_yarrelli
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Sisoridae';
metaData.species    = 'Bagarius_yarrelli'; 
metaData.species_en = 'Goonch'; 

metaData.ecoCode.climate = {'Aw','Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 11];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 80;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';   bibkey.Lp = 'guess';
data.Li = 230;     units.Li = 'cm';   label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 2.6e3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.00525*Lp^2.99, see F1';
data.Wwi = 60.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^2.99, see F1';

data.GSI = 0.045; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(25); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), length (mm)
  1	17.433
  2	27.523
  3	32.163
  4	34.978
  5	42.338];
data.tL(:,1) = (data.tL(:,1) + 0.1) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JianGuo2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 2;
weights.ab = weights.ab * 0;
weights.Li = weights.Li * 3;
weights.GSI = weights.GSI * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00525*(TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KDCM'; % Cat of Life
metaData.links.id_ITIS = '681828'; % ITIS
metaData.links.id_EoL = '681977'; % Ency of Life
metaData.links.id_Wiki = 'Bagarius_yarrelli'; % Wikipedia
metaData.links.id_ADW = 'Bagarius_yarrelli'; % ADW
metaData.links.id_Taxo = '162800'; % Taxonomicon
metaData.links.id_WoRMS = '1018581'; % WoRMS
metaData.links.id_fishbase = 'Bagarius-yarrelli'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Bagarius_yarrelli}}';  
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
bibkey = 'JianGuo2019'; type = 'Article'; bib = [ ...
'doi = {10.3390/ijms20040944}, ' ...
'author = {Jiang, Wansheng and Guo, Yicheng and Yang, Kunfeng and Shi, Qiong and Yang, Junxing}, ' ...
'year = {2019}, ' ...
'title = {Insights into Body Size Evolution: A Comparative Transcriptome Study on Three Species of {A}sian {S}isoridae Catfish}, ' ... 
'journal = {International Journal of Molecular Sciences}, ' ...
'volume = {20(4)}, '...
'pages = {944}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bagarius-yarrelli.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

