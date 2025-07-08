function [data, auxData, metaData, txtData, weights] = mydata_Sillago_ciliata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sillaginidae';
metaData.species    = 'Sillago_ciliata'; 
metaData.species_en = 'Sand sillago';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 15];

%% set data
% zero-variate data

data.ab = 8;       units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Clel1947';   
  temp.ab = C2K(22.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'hatch at 1 d';
data.am = 22*365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 22.5; units.Lp  = 'cm'; label.Lp  = 'fork length at puberty';     bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'Clel1947 gives 26 cm';
data.Li  = 51;     units.Li  = 'cm'; label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.66 mm of Sillago sihama: pi/6*0.066^3';
data.Wwi = 1.4e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00617*Li^3.13, see F1';
 
data.Ri  = 380e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Fecundity 380000';

% uni-variate data
% time-length
data.tW = [ ... % time since birth (mnth), std length (ounce)
10.240	1.301
22.325	5.188
34.543	8.195
46.053	10.533
58.261	12.485
70.325	14.156];
data.tW(:,1) = data.tW(:,1)*30.5; % convert mnth to d
data.tW(:,2) = data.tW(:,2)*28.3495231; % convert once to g
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
temp.tW  = C2K(25.4); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Clel1947';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ for females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00617*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6Z2HQ'; % Cat of Life
metaData.links.id_ITIS = '168531'; % ITIS
metaData.links.id_EoL = '46579896'; % Ency of Life
metaData.links.id_Wiki = 'Sillago_ciliata'; % Wikipedia
metaData.links.id_ADW = 'Sillago_ciliata'; % ADW
metaData.links.id_Taxo = '45210'; % Taxonomicon
metaData.links.id_WoRMS = '273939'; % WoRMS
metaData.links.id_fishbase = 'Sillago_ciliata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sillago_ciliata}}';
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
bibkey = 'Clel1947'; type = 'Article'; bib = [ ... 
'author = {Cleland, K. W. }, ' ... 
'year = {1947}, ' ...
'title = {Studies on the economic biology of the sand whiting (\emph{Sillago ciliata} C. \& V.)}, ' ...
'journal = {Proceedings of the Linnean Society of New South Wales}, ' ...
'volume = {72}, ' ...
'pages = {215-228}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Sillago-ciliata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
