function [data, auxData, metaData, txtData, weights] = mydata_Pelusios_castanoides
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Pelomedusidae';
metaData.species    = 'Pelusios_castanoides'; 
metaData.species_en = 'Yellow-bellied mud turtle';

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'piO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 02];

%% set data
% zero-variate data

data.tp = 2*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Gerl2008';
  temp.tp = C2K(30);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 40*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'Gerl2008';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'Gerl2008';
data.Li = 17; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Gerl2008';

data.Wwi = 1795; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'EoL';

data.Ri  = 6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on weight-corrected value for Podocnemis_unifilis: 40*1795/11600';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), carapace length (cm)
0.003	3.036
0.326	7.223
0.936	12.160
1.329	13.443
2.941	16.564];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = C2K(30);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gerl2008';
comment.tL = ' temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ fro females';   
D2 = 'age at puberty is ignored because it is incosistent with Lp combined with tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '76FLX'; % Cat of Life
metaData.links.id_ITIS = '551823'; % ITIS
metaData.links.id_EoL = '791169'; % Ency of Life
metaData.links.id_Wiki = 'Pelusios_castanoides'; % Wikipedia
metaData.links.id_ADW = 'Pelusios_castanoides'; % ADW
metaData.links.id_Taxo = '48208'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pelusios&species=castanoides'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelusios_castanoides}}';
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
bibkey = 'Gerl2008'; type = 'Article'; bib = [ ... 
'author = {Justin Gerlach}, ' ... 
'year = {2008}, ' ...
'title = {Fragmentation and Demography as Causes of Population Decline in {S}eychelles Freshwater Turtles (Genus \emph{Pelusios})}, ' ...
'journal = {Chelonian Conservation and Biology}, ' ...
'volume = {7(1)}, ' ...
'pages = {78-87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/791169}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

