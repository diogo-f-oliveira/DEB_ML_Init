function [data, auxData, metaData, txtData, weights] = mydata_Ilisha_melastoma

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Pristigasteridae';
metaData.species    = 'Ilisha_melastoma'; 
metaData.species_en = 'Indian ilisha'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MIN'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L','L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 13];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 1*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'BlabStau1998';   
  temp.am = C2K(28.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.5;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'BlabStau1998';
data.Li = 14;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'BlabStau1998';
  comment.Li = 'fishbase gives 22 cm';

data.Wwb = 1.6e-3; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'BlabStau1998';
  comment.Wwb = 'based on egg diameter of 1.46 mm: pi/6*0.146^3';
data.Wwp = 4.7; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'BlabStau1998','fishbase'};
  comment.Wwp = 'based on 0.00851*(Lp/0.82)^3.05, see F1';
data.Wwi = 48.8; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'BlabStau1998','fishbase'};
  comment.Wwi = 'based on 0.00851*(Li/0.82)^3.05';
  
data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'BlabStau1998';
  temp.GSI = C2K(28.6); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), std length (cm)
136.191	7.081
151.426	8.536
153.061	7.601
168.422	7.830
209.830	9.102
222.030	10.149
237.337	10.903
252.734	10.782
257.332	10.956
258.810	11.539
272.711	11.010
274.393	9.609
275.728	11.593
280.332	11.708
292.592	12.171
295.627	12.579
301.793	12.461
301.919	11.235
329.462	12.686
332.467	13.385];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(28.6); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BlabStau1998';

% length-fecundity
data.LN = [ ... % std length (cm), weight (g)
10.479	4468.330
10.988	4399.233
11.575	8268.714
11.683	9213.052
12.201	6863.724
12.402	9259.117
12.486	10180.422
12.618	6403.071
13.212	7485.605];
units.LN = {'cm', '#'};  label.LN = {'std length', 'fecundity'}; 
bibkey.LN = 'BlabStau1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.LN = 5 * weights.LN;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 0 * weights.ab;
weights.GSI = 0 * weights.GSI;

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
D2 = 'GSI is at odds with LN data, possibly due to water absorption by eggs';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.82 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3PG8G'; % Cat of Life
metaData.links.id_ITIS = '551316'; % ITIS
metaData.links.id_EoL = '46562733'; % Ency of Life
metaData.links.id_Wiki = 'Ilisha'; % Wikipedia
metaData.links.id_ADW = 'Ilisha_melastoma'; % ADW
metaData.links.id_Taxo = '177497'; % Taxonomicon
metaData.links.id_WoRMS = '281167'; % WoRMS
metaData.links.id_fishbase = 'Ilisha-melastoma'; % fishbase

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
bibkey = 'BlabStau1998'; type = 'Article'; bib = [ ...  
'doi = {10.1006/ecss.1998.0376}, ' ...
'author = {S.J.M. Blaber and J. Staunton-Smith and D.A. Milton and G. Fry and T. Van der Velde and J. Pang and P. Wong and Ong Boon-Teck}, ' ...
'year = {1998}, ' ...
'title = {The Biology and Life-history Strategies of \emph{Ilisha} ({T}eleostei: {P}ristigasteridae) in the Coastal Waters and Estuaries of {S}arawak}, ' ... 
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {47(4)}, ' ...
'pages = {499–511}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ilisha-melastoma.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
