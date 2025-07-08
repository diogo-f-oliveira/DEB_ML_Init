function [data, auxData, metaData, txtData, weights] = mydata_Pomacea_urceus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Ampullariidae';
metaData.species    = 'Pomacea_urceus'; 
metaData.species_en = 'Black river conch'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr', '0iFm'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30.5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'WCi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 04]; 

%% set data
% zero-variate data

data.am = 3.5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Burk1974';   
  temp.am = C2K(30.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.15;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'Burk1974';
data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Burk1974';
data.Li  = 13;    units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'Burk1974';

data.WCi  = 11.01;    units.WCi  = 'g';  label.WCi  = 'tissue carbon weight at SL 11 cm'; bibkey.WCi  = 'Burk1974';

data.Ri  = 125.5/365; units.Ri  = '#/d'; label.Ri = 'reproduction rate for SL 11.45 cm';  bibkey.Ri  = 'Burk1974';   
  temp.Ri = C2K(30.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '125.5 eggs per clutch, 1 clutch per season assumed';

% uni-variate data
% time-length
data.tL = [ ... % age (d), shell length (cm)
13.844	1.039
66.179	1.093
121.892	1.046
151.267	1.124
184.357	2.747
219.473	4.446
254.251	6.397
316.378	8.402
347.780	9.973
365+14.857	10.710
365+66.855	11.625
365+122.905	11.122
365+150.592	11.302
365+183.682	9.937
365+218.797	11.458
365+254.926	10.954
365+315.365	11.262
365+346.767	11.492];
units.tL   = {'d', 'cm'};  label.tL = {'time birth', 'shell length'};  
temp.tL   = C2K(30.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Burk1974';
comment.tL = 'Data from El Estero de Camaguan, Venezuela; Temperature 28.6-32.8';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.WCi = 5 * weights.WCi;

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
D2 = 'Growth in tL data coincides with rainy season, floowed by flooding';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '786G7'; % Cat of Life
metaData.links.id_ITIS = '204973'; % ITIS
metaData.links.id_EoL = '52575911'; % Ency of Life
metaData.links.id_Wiki = 'Pomacea_urceus'; % Wikipedia
metaData.links.id_ADW = 'Pomacea_urceus'; % ADW
metaData.links.id_Taxo = '542428'; % Taxonomicon
metaData.links.id_WoRMS = '848374'; % WoRMS
metaData.links.id_molluscabase = '848374'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomacea_urceus}}';
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
bibkey = 'Burk1974'; type = 'Article'; bib = [ ... 
'author = {Albert J. Burky}, ' ... 
'year = {1974}, ' ...
'title = {Growth and biomass production of an amphibious snail, \emph{Pomacea urceus} ({M}\"{u}ller), from the {V}enezuelan savannah}, ' ...
'journal = {Proc. malac. Soc. Lond.}, ' ...
'volume = {41}, ' ...
'pages = {127-143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

