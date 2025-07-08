  function [data, auxData, metaData, txtData, weights] = mydata_Conger_conger

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Congridae';
metaData.species    = 'Conger_conger'; 
metaData.species_en = 'European conger'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAN', 'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMpe', 'piMd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 27]; 

%% set data
% zero-variate data
data.am = 55*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Anguilla anguilla';

data.Lp = 200;     units.Lp = 'cm';   label.Lp = 'total length at puberty for female';bibkey.Lp = 'Wiki';
data.Lpm = 120;     units.Lpm = 'cm';   label.Lpm = 'total length at puberty for male';bibkey.Lpm = 'Wiki';
data.Li = 300;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';

data.Wwb = 1.3e-3; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Cunn1981';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.135^3';
data.Wwp = 7e3;    units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Wiki';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 110e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
  
data.Ri = 2e6/365;  units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
 4  42
 5  55
 8 106
 9 109
10 109
11 109
12 119
13 123
14 130
15 128
16 138
17 130
18 140
20 156]; 
data.tL(:,1) = (0.5 + data.tL(:,1)) * 365;
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(10); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'SullMori2003';

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
 4  142
 5  564
 8 2472
 9 3091
10 2768
11 3091
12 4155
13 4243
14 4430
15 4250
16 5000
17 5025
18 6000
20 9000]; 
data.tW(:,1) = (0.5 + data.tW(:,1)) * 365;
units.tW = {'d', 'g'};     label.tW = {'time since birth', 'wet weight'};  
  temp.tW = C2K(10);  units.temp.tW = 'K'; label.temp.tW = 'temperature'; 
bibkey.tW = 'SullMori2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.tW = 10 * weights.tW;
weights.Li = 5 * weights.Li;
weights.Wwi = 0 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'The embryo and early juvenile stages were bypassed in the analysis';
D2 = 'Wiki and fishbase give max published Li = 3 m and Wwi = 110 kg, it is not clear that a 3 m actually weighs 110 kg. Wwi and Wwp are ignored';
D3 = 'Temperatures are guessed';
D4 = 'Males are assumed to differe from females by E_Hp only; no max size data found for males';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4);

%% Links
metaData.links.id_CoL = 'XLH2'; % Cat of Life
metaData.links.id_ITIS = '161341'; % ITIS
metaData.links.id_EoL = '46561395'; % Ency of Life
metaData.links.id_Wiki = 'Conger_conger'; % Wikipedia
metaData.links.id_ADW = 'Conger_conger'; % ADW
metaData.links.id_Taxo = '42568'; % Taxonomicon
metaData.links.id_WoRMS = '126285'; % WoRMS
metaData.links.id_fishbase = 'Conger-conger'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Conger_conger}}';  
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
bibkey = 'SullMori2003'; type = 'Article'; bib = [ ...  
'author = {S. O''Sullivan and C. Moriarty and R. D. FitzGerald and J. Davenport and M. F. Mulcahy}, ' ...
'year = {2003}, ' ...
'title = {Age, growth and reproductive status of the {E}uropean conger eel, \emph{Conger conger} ({L}.) in {I}rish coastal waters}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {64}, '...
'pages = {55-69}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cunn1981'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315400049444}, ' ...
'author = {J. T. Cunningham}, ' ...
'year = {1891}, ' ...
'title = {On the Reproduction and Development of the Conger}, ' ... 
'journal = {J. Mar. Biol. Assoc. U.K.}, ' ...
'volume = {2}, '...
'pages = {16-42}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Conger-conger.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
