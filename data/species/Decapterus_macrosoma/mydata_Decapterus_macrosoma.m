function [data, auxData, metaData, txtData, weights] = mydata_Decapterus_macrosoma

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Decapterus_macrosoma'; 
metaData.species_en = 'Shortfin scad'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 21];

%% set data
% zero-variate data
data.ab = 4.5;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.3); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 17.6; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 35;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'Scre1981';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 389; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'fishbase: based on 0.01047*Li^2.96, see F1';

data.Ri  = 106200/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(27.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
347.367	13.249
407.339	14.064
422.646	14.829
429.185	14.877
436.796	14.687
446.580	14.400
460.782	14.974
468.432	15.309
479.346	15.596
492.425	15.692
492.467	16.266
515.329	16.076
520.817	16.649
530.600	16.363
572.001	16.460
586.173	16.604
609.049	16.606
616.671	16.558
621.098	17.514
639.630	17.706
662.523	17.946
667.921	17.277
670.159	18.089
675.561	17.469
721.375	18.331
728.993	18.236
733.326	17.901
746.454	18.666
753.007	18.905
768.264	19.002
769.295	18.190
799.893	19.529
805.270	18.574
811.845	19.099
820.559	19.100
836.937	19.626
846.772	20.056
864.188	19.866
873.988	19.819
881.634	20.106
889.281	20.393
896.888	20.154
956.843	20.730
960.094	20.492
992.791	20.732];
data.tL(:,1) = data.tL(:,1)+90; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(27.3); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SousGjos1987';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
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
D1 = 'males are assumed not to differ from females';
D2 = 'I had to add 90 d to age estimates in tL data to arrive at a natural fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34CZS'; % Cat of Life
metaData.links.id_ITIS = '168735'; % ITIS
metaData.links.id_EoL = '46577988'; % Ency of Life
metaData.links.id_Wiki = 'Decapterus'; % Wikipedia
metaData.links.id_ADW = 'Decapterus_macrosoma'; % ADW
metaData.links.id_Taxo = '172948'; % Taxonomicon
metaData.links.id_WoRMS = '218426'; % WoRMS
metaData.links.id_fishbase = 'Decapterus-macrosoma'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Decapterus}}';  
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
bibkey = 'SousGjos1987'; type = 'article'; bib = [ ... 
'author = {Sousa, M.I. and Gj{\o}saeter, J.}, ' ...
'year = {1987}, ' ...
'title = {A revision of growth parameters of some commercially exploited fishes from {M}ozambique}, ' ... 
'journal = {Revista de Investigagao Pesqueira Maputo}, ' ...
'volume = {16}, ' ...
'pages = {19-40},' ...
'howpublished = {\url{https://aquadocs.org/handle/1834/32668}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Scre1981'; type = 'article'; bib = [ ... 
'author = {P. V. Sreenvasan}, ' ...
'year = {1981}, ' ...
'title = {MATURITY AND SPAWNING IN \emph{Decapterus dayi} {W}AKIYA}, ' ... 
'journal = {J. mar. bio. Ass. India}, ' ...
'volume = {23(1/2)}, ' ...
'pages = {19-28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Decapterus-macrosoma.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
