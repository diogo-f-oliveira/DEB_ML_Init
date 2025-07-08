function [data, auxData, metaData, txtData, weights] = mydata_Ilisha_africana

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Pristigasteridae';
metaData.species    = 'Ilisha_africana'; 
metaData.species_en = 'West African ilisha'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 24];

%% set data
% zero-variate data
data.ab = 5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'BlabStau1998';   
  temp.am = C2K(27.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'BlabStau1998';
data.Li = 30;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'BlabStau1998';

data.Wwb = 1.14e-2; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'BlabStau1998';
  comment.Wwb = 'based on egg diameter of 2.79 mm: pi/6*0.279^3';
data.Wwp = 15; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'BlabStau1998','fishbase'};
  comment.Wwp = 'based on 0.00661*Lp^3.02, see F1';
data.Wwi = 191; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'BlabStau1998','fishbase'};
  comment.Wwi = 'based on 0.00661*Li^3.02, see F1';
  
data.Ri = 17219/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(27.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), std length (cm)
135.657	6.988
165.637	7.879
198.614	9.927
227.094	10.822
259.322	12.484
289.302	15.705];
data.tL(:,1) = data.tL(:,1)-90;
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(27.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Show1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;
weights.ab = 0 * weights.ab;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00661*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3PG7X'; % Cat of Life
metaData.links.id_ITIS = '551312'; % ITIS
metaData.links.id_EoL = '46562727'; % Ency of Life
metaData.links.id_Wiki = 'Ilisha'; % Wikipedia
metaData.links.id_ADW = 'Ilisha_africana'; % ADW
metaData.links.id_Taxo = '177491'; % Taxonomicon
metaData.links.id_WoRMS = '281161'; % WoRMS
metaData.links.id_fishbase = 'Ilisha-africana'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ilisha}}';  
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
bibkey = 'Show1998'; type = 'Article'; bib = [ ...  
'doi = {10.1006/ecss.1998.0376}, ' ...
'author = {Showers, P.A.T.}, ' ...
'year = {1998}, ' ...
'title = {Comparative growth performance for species of the family Clupeidae of Sierra Leone}, ' ... 
'journal = {Naga ICLARM Q.}, ' ...
'volume = {19(4)}, ' ...
'pages = {42-44}, ' ...
'howpublished = {\url{https://aquadocs.org/bitstream/handle/1834/26109/na_2124.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ilisha-africana.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
