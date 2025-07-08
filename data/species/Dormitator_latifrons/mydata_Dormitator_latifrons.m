function [data, auxData, metaData, txtData, weights] = mydata_Dormitator_latifrons

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Eleotridae';
metaData.species    = 'Dormitator_latifrons'; 
metaData.species_en = 'Pacific fat sleeper'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Md'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'dWw'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 21];

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';   label.am = 'life span';                          bibkey.am = 'fishbase';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 7.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty';             bibkey.Lp  = 'ChanNava1984'; 
data.Li  = 39; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'ChanNava1984';
data.Lim  = 41; units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'ChanNava1984';

data.Wwb = 7.7e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'ChanNava1984';
  comment.Wwb = 'based on # of egg per gram of gonad: 1.3e5 eggs/g';
data.Wwi = 1.05e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'ChanNava1984';
  comment.Wwi = 'based on 1.3e3 g of which a fraction 0.19 is gonad';
data.Wwim = 1.2e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'ChanNava1984';
  comment.Wwim = 'based on 0.01023*Lim^3.07, see F1';

data.dWw = 263.4/90;  units.dWw = 'g/d';   label.dWw = 'change in wet weight at 15 g'; bibkey.dWw = 'BastRodr2019';
  temp.dWw = C2K(31); units.temp.dWw = 'K'; label.temp.dWw = 'temperature';
  comment.dWw = 'measured over 90 d';

data.GSI = 0.19 ; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'ChanNava1984'; 
  temp.GSI = C2K(26); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% length-change in length
data.tL = [ ... % time since 1 Jan (d), total length (cm)
122.824	15.909
168.528	18.818
197.106	20.818
228.090	24.545
295.177	24.545
316.712	23.636
345.311	25.909];
data.tL(:,1) = data.tL(:,1) - data.tL(1,1); % shift origin
units.tL  = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL   = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChanNava1984';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
%weights.dWw = 5 * weights.dWw;
%weights.Li = 5 * weights.Li;
%weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.83 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '37DQD'; % Cat of Life
metaData.links.id_ITIS = '171918'; % ITIS
metaData.links.id_EoL = '46576835'; % Ency of Life
metaData.links.id_Wiki = 'Dormitator_latifrons'; % Wikipedia
metaData.links.id_ADW = 'Dormitator_latifrons'; % ADW
metaData.links.id_Taxo = '173380'; % Taxonomicon
metaData.links.id_WoRMS = '276408'; % WoRMS
metaData.links.id_fishbase = 'Dormitator-latifrons'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dormitator_latifrons}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Dormitator-latifrons.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BastRodr2019'; type = 'article'; bib = [ ... 
'author = {Mao Ernesto Rafae  Basto-Rosales and Gustavo Alejandro Rodriguez-Montes de Oca and Olimpia Carrillo-Farn\''{e}s and Carlos Alfonso Alvarez-Gonz\''{a}lez and Daniel Badillo-Zapata and Fernando Vega-Villasante}, ' ... 
'year = {2019}, ' ...
'title = {GROWTH OF \emph{Dormitator latifrons} UNDER DIFFERENT DENSITIES IN CONCRETE TANKS}, ' ...
'journal = {Tropical and Subtropical Agroecosystems}, ' ...
'volume = {22}, ' ...
'pages = {499-503}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChanNava1984'; type = 'article'; bib = [ ... 
'author = {B. D. Chang and W. Navas}, ' ... 
'year = {1984}, ' ...
'title = {Seasonal variations in growth, condition and gonads of \emph{Dormitator latifrons} ({R}ichardson) in the {C}hone {R}iver {B}asin, {E}cuador}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {24}, ' ...
'pages = {637-647}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


