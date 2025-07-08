function [data, auxData, metaData, txtData, weights] = mydata_Ilisha_filigera

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Pristigasteridae';
metaData.species    = 'Ilisha_filigera'; 
metaData.species_en = 'Coromandel ilisha'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
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
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'BlabStau1998';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 26;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'BlabStau1998';
data.Li = 83;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'BlabStau1998';
  comment.Li = 'fishbase gives 22 cm';

data.Wwb = 1.14e-2; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'BlabStau1998';
  comment.Wwb = 'based on egg diameter of 2.79 mm: pi/6*0.279^3';
data.Wwp = 360; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'BlabStau1998','fishbase'};
  comment.Wwp = 'based on 0.01023*(Lp/0.84)^3.05, see F1';
data.Wwi = 12.4e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'BlabStau1998','fishbase'};
  comment.Wwi = 'based on 0.01023*(Li/0.84)^3.05, see F1';
  
data.GSI = 0.11; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'BlabStau1998';
  temp.GSI = C2K(27); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), std length (cm)
86.099	4.098
118.472	6.929
123.962	8.812
129.137	5.990
161.490	8.507
167.064	11.645
172.071	6.313
188.605	12.905
193.801	10.396
199.354	13.221
220.957	15.422
280.088	17.318
360.928	22.983
361.222	27.375
463.792	37.124
485.332	38.383
501.635	41.524
533.693	39.649
555.191	40.281
561.102	48.439
566.130	43.421
576.900	44.051
587.565	43.112
587.796	46.563
603.783	44.998
641.647	49.712
791.841	49.746
1012.357	58.580
1055.206	57.648
1324.503	74.022
1356.456	70.578];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(27); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BlabStau1998';

% length-fecundity
data.LN = [ ... % std length (cm), weight (g)
26.228	18145.806
37.855	99926.023
38.685	121333.970
56.678	171609.593];
units.LN = {'cm', '#'};  label.LN = {'std length', 'fecundity'}; 
bibkey.LN = 'BlabStau1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
% weights.LN = 5 * weights.LN;
% weights.Li = 3 * weights.Li;
% weights.Lp = 3 * weights.Lp;
% weights.Wwb = 3 * weights.Wwb;
% weights.Wwi = 3 * weights.Wwi;
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
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3PG7X'; % Cat of Life
metaData.links.id_ITIS = '551312'; % ITIS
metaData.links.id_EoL = '46562727'; % Ency of Life
metaData.links.id_Wiki = 'Ilisha'; % Wikipedia
metaData.links.id_ADW = 'Ilisha_filigera'; % ADW
metaData.links.id_Taxo = '177491'; % Taxonomicon
metaData.links.id_WoRMS = '281161'; % WoRMS
metaData.links.id_fishbase = 'Ilisha-filigera'; % fishbase

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
'howpublished = {\url{http://www.fishbase.se/summary/Ilisha-filigera.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
