  function [data, auxData, metaData, txtData, weights] = mydata_Anguilla_rostrata
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Anguillidae';
metaData.species    = 'Anguilla_rostrata'; 
metaData.species_en = 'American eel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMpe', 'jpFl', 'jpFp', 'jpFr', 'piMd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't=Ww'};

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 07];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 07];

%% set data
% zero-variate data
data.am = 43*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(6.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 40;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Jess1987';
data.Li = 152;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.3e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm for Anguila anguilla: pi/6*0.1^3';
data.Wwi = 7.5e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00087*Li^3.18, see F1;max. published weight: 7.3 kg';
  
data.Ri = 20e6/(40*365);  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(6.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length-weight
data.tLW = [ ... % age (yr), total length (cm), weight (g)
10.5 57.2 375
12.5 60.3 441
14.5 55.8 337
16.5 58.8 397
18.5 58.0 409
20.5 58.7 438
22.5 61.2 478 
24.5 68.4 742
26.5 72.9 849
28.5 72.7 830
30.5 71.5 806
32.5 72.5 757
34.5 74.3 786
42.5 71.9 627];
data.tLW(:,1) = 365 * data.tLW(:,1); % convert yr to d
units.tLW = {'d', 'cm', 'g'};   label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW = C2K(6.3); units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'Jess1987'; comment.tLW = 'data from LaHave Rive'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 10 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures were guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00087*(TL in cm)^3.18';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Spawns in Sargasso Sea';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '66R74'; % Cat of Life
metaData.links.id_ITIS = '161127'; % ITIS
metaData.links.id_EoL = '46561252'; % Ency of Life
metaData.links.id_Wiki = 'Anguilla_rostrata'; % Wikipedia
metaData.links.id_ADW = 'Anguilla_rostrata'; % ADW
metaData.links.id_Taxo = '42528'; % Taxonomicon
metaData.links.id_WoRMS = '158562'; % WoRMS
metaData.links.id_fishbase = 'Anguilla-rostrata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anguilla-rostrata}}';  
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
bibkey = 'Jess1987'; type = 'Article'; bib = [ ...  
'doi = {10.1577/1548-8659(1987)116<161:maeins>2.0.co;2}, ' ...
'author = {Jessop, B. M.}, ' ...
'year = {1987}, ' ...
'title = {Migrating {A}merican Eels in {N}ova {S}cotia}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {116(2)}, '...
'pages = {161–170}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
 bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Anguilla-rostrata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


