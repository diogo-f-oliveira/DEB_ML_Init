function [data, auxData, metaData, txtData, weights] = mydata_Ambystoma_opacum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Ambystomatidae';
metaData.species    = 'Ambystoma_opacum'; 
metaData.species_en = 'Marbled salamander'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFc'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 30];

%% set data
% zero-variate data

data.ab = 60;  units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'guess';
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 60;  units.tj = 'd';    label.tj = 'time since birth at metam';  bibkey.tj = 'srelherp';
  temp.tj = C2K(17);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '2-9 mnth';
data.tp = 1.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'srelherp';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11.3*365;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 6;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';            bibkey.Li  = 'srelherp';
  comment.Li = 'TL 10.7 cm, coverted to SVL using F1';
  
data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm for Ambystoma_maculatum: pi/6*0.2^3';
data.Wwi = 1.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Ambystoma_maculatum: 12.84*(6/13)^3';

data.Ri = 100/365; units.Ri = '#/d';   label.Ri = 'reprod rate at 25.3 g';         bibkey.Ri = 'amphibiaweb';
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '100 eggs per clutch, 1 clutch per yr';

% uni-variate data
% time-length
data.tL = [ ... time (d), SVL (cm)
3.535	2.233
11.608	2.329
19.672	2.366
37.255	2.547
45.885	2.528
45.885	2.528
68.995	3.066
75.024	2.975
80.513	3.108
90.057	3.397];
data.tL(:,1) = data.tL(:,1) - data.tL(1,1);
units.tL  = {'d', 'cm'};  label.tL = {'time', 'SVL'};  
temp.tL   = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Keen1975';  

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

%% Facts
F1 = 'From photo: SVL = TL * 0.56';
metaData.bibkey.F1 = 'agefotostock'; 
F2 = 'Lays eggs under leaves of dried-out pools; larvae hatch when the pool refills';
metaData.bibkey.F2 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'CQ4T'; % Cat of Life
metaData.links.id_ITIS = '173591'; % ITIS
metaData.links.id_EoL = '330513'; % Ency of Life
metaData.links.id_Wiki = 'Ambystoma_opacum'; % Wikipedia
metaData.links.id_ADW = 'Ambystoma_opacum'; % ADW
metaData.links.id_Taxo = '47377'; % Taxonomicon
metaData.links.id_WoRMS = '1369400'; % WoRMS
metaData.links.id_amphweb = 'Ambystoma+opacum'; % AmphibiaWeb
metaData.links.id_AnAge = 'Ambystoma_opacum'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ambystoma_opacum}}';
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
bibkey = 'Keen1975'; type = 'Article'; bib = [ ... 
'author = {W. Hubert Keen}, ' ... 
'year = {1975}, ' ...
'title = {Breeding and Larval Development of Three Species of \emph{Ambystoma} in Central {K}entucky ({A}mphibia: {U}rodela)}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {31(1)}, ' ...
'pages = {18-21}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Ambystoma+opacum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Ambystoma_opacum/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ambystoma_opacum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'agefotostock'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.agefotostock.com/age/en/details-photo/marbled-salamander-mole-salamander-ambystoma-opacum-cutout-usa/BWI-BS445796}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'srelherp'; type = 'Misc'; bib = ...
'howpublished = {\url{https://srelherp.uga.edu/salamanders/ambopa.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



