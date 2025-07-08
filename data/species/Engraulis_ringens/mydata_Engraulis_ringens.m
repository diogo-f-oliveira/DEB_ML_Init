function [data, auxData, metaData, txtData, weights] = mydata_Engraulis_ringens
  
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Engraulis_ringens'; 
metaData.species_en = 'Anchoveta'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 12];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 3*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on  Engraulis encrasicolus';

data.Lp = 12;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'fishbase';
data.Li = 20;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 9e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 10.64; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00457*Lp^3.12, see F1';
data.Wwi = 52.4; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00457*Li^3.12, see F1';
  
data.Ri = 8903 /365;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'CubiAlar2011';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
-83.429	7.804
-54.229	8.781
0.000	8.591
25.029	9.047
62.571	10.155
125.143	10.355
141.829	11.590
171.029	13.151
221.086	13.610
246.114	13.353
275.314	14.849
304.514	15.501
342.057	13.881
358.743	14.662
371.257	14.858
463.028	15.970
508.914	14.870
546.457	16.042
571.486	15.979
600.686	16.566
646.571	16.376
671.600	16.573
696.629	17.354
721.657	16.187
750.857	15.800
784.229	16.907
917.714	17.049];
data.tL(:,1) = data.tL(:,1)-data.tL(1,1); % set origin at first data point
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(18); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CubiBuca2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 5 * weights.Wwb;

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
D2 = 'Temperature (in C) is assumed to vary as T(t)=12+9*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00457*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39TNG'; % Cat of Life
metaData.links.id_ITIS = '551340'; % ITIS
metaData.links.id_EoL = '46562566'; % Ency of Life
metaData.links.id_Wiki = 'Engraulis_ringens'; % Wikipedia
metaData.links.id_ADW = 'Engraulis_ringens'; % ADW
metaData.links.id_Taxo = '42688'; % Taxonomicon
metaData.links.id_WoRMS = '272287'; % WoRMS
metaData.links.id_fishbase = 'Engraulis-ringens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Engraulis_ringens}}';  
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
bibkey = 'CubiBuca2002'; type = 'Article'; bib = [ ...  
'author = {Luis A. Cubillos and Doris A. Bucarey and Mariella Canales}, ' ...
'year = {2002}, ' ...
'title = {Monthly abundance estimation for common sardine \emph{Strangomera bentincki} and anchovy \emph{Engraulis ringens} in the central-southern area off {C}hile (34-40 S)}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {57}, '...
'pages = {117-130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CubiAlar2011'; type = 'Article'; bib = [ ...  
    'doi = {10.7773/cm.v37i4B.1749 }, '...
'author = {L.A. Cubillos and C. Alarc\''{o}n and C. Castillo-Jord\''{a}n and G. Claramunt and C. Oyarz\''{u}n and S Gacit\''{u}a}, ' ...
'year = {2011}, ' ...
'title = {Spatial and temporal changes in batch fecundity of common sardine and anchovy off central and southern Chile (2002–2007) }, ' ... 
'journal = {Ciencias Marinas}, ' ...
'volume = {37(4B)}, '...
'pages = {547–564}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Engraulis-ringens.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
