function [data, auxData, metaData, txtData, weights] = mydata_Ctenopharyngodon_idella

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Ctenopharyngodon_idella'; 
metaData.species_en = 'Grass carp'; 

metaData.ecoCode.climate = {'B','C','D'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 18]; 

%% set data
% zero-variate data

data.tp = 365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'fishbase';   
  temp.tp = C2K(16); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 21*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 60;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'fishbase'; 
  comment.Lp = '58 - 70.2 cm';
data.Li = 150;    units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.0e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 2.68e3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01349*Lp^2.98, see F1';
data.Wwi = 41.2e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01349*Li^2.98, see F1';

data.Ri = 1.5e6/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time (d), standard length (cm)
 0.000	10.801
15.000	11.986
29.000	12.091
42.000	12.892
56.000	14.251
71.000	16.132
84.000	17.840
97.000	19.791
112.000	23.275
126.000	23.763
140.000	24.878
154.000	26.063
168.000	28.118
182.000	30.383];
data.tL(:,1) = 70 + data.tL(:,1); % set origin at birth
data.tL(:,2) = data.tL(:,2)/0.74; % conver SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(28.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VenkShet1978'; 
%
% time-weight
data.tWw = [ ... % time (d), wet weight (g)
 0.000	12.479
15.000	18.656
29.000	20.645
42.000	25.436
56.000	35.121
71.000	50.396
84.000	81.759
97.000	106.129
112.000	175.252
126.000	180.742
140.000	194.619
154.000	228.779
168.000	280.417
182.000	380.312];
data.tWw(:,1) = 70 + data.tWw(:,1); % set origin at birth
units.tWw = {'d', 'g'}; label.tWw = {'time since hatch', 'wet weight'};  
temp.tWw = C2K(28.2);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'VenkShet1978'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: W in g = 0.01349*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL=0.74*TL';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '326B3'; % Cat of Life
metaData.links.id_ITIS = '163537'; % ITIS
metaData.links.id_EoL = '212044'; % Ency of Life
metaData.links.id_Wiki = 'Ctenopharyngodon_idella'; % Wikipedia
metaData.links.id_ADW = 'Ctenopharyngodon_idella'; % ADW
metaData.links.id_Taxo = '43628'; % Taxonomicon
metaData.links.id_WoRMS = '154314'; % WoRMS
metaData.links.id_fishbase = 'Ctenopharyngodon-idella'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ctenopharyngodon_idella}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Ctenopharyngodon-idella.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'VenkShet1978'; type = 'article'; bib = [ ... 
'author = {B. Venkatesh and H.P.C. Shetty}, ' ...
'year = {1978}, ' ...
'title  = {STUDIES ON THE GROWTH RATE OF THE GRASS CARP \emph{Ctenopharyngodon idella} ({V}ALENCIENNES) FED ON TWO AQUATIC WEEDS AND A TERRESTRIAL GRASS}, ' ...
'journal = {Aquaculture}, ' ...
'pages = {45-53}, ' ...
'volume = {13}'];
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

