function [data, auxData, metaData, txtData, weights] = mydata_Laevilacunaria_antarctica
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Littorinimorpha'; 
metaData.family     = 'Littorinidae';
metaData.species    = 'Laevilacunaria_antarctica'; 
metaData.species_en = 'Antarctic littorinid'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 25]; 

%% set data
% zero-variate data

data.am = 4*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Pick1979';   
  temp.am = C2K(2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.094; units.Lb  = 'cm';  label.Lb  = 'shell diameter at birth';         bibkey.Lb  = 'Pick1979';
data.Lp  = 0.3; units.Lp  = 'cm';  label.Lp  = 'shell height at puberty for female'; bibkey.Lp  = 'guess';
data.Li  = 0.71; units.Li  = 'cm';  label.Li  = 'ultimate shell height';              bibkey.Li  = 'Pick1979';

data.Wdi = 1.67e-3;  units.Wdi = 'g'; label.Wdi = 'egg dry weight'; bibkey.Wdi = 'Pick1979';
  comment.Wdi = 'based on 10^(3.1050*log10(10*Li) - 4.4207), see F2';

data.Ri  = 47/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Pick1979';   
  temp.Ri = C2K(2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 1 clutch of 47 young per season';

% uni-variate data
% time-length
data.tL = [ ... % time since 1 mrt 1961 (d), shell diameter (cm)
0.000	0.092
35.866	0.100
68.955	0.094
95.436	0.092
136.851	0.104
155.069	0.107
179.970	0.133
198.210	0.145
221.501	0.187
256.370	0.225
285.414	0.253
311.949	0.271
369.174	0.313
398.125	0.307
428.758	0.310
464.352	0.312
487.576	0.330
520.683	0.330
547.346	0.394
566.592	0.470
606.445	0.516
627.987	0.524];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell diameter'};  
temp.tL    = C2K(2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Pick1979';
comment.tL = 'Data for 1975 0 class at at Signy Island, South Orkney Islands';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 10 * weights.Li;

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
D2 = 'Temperature (in C) for tL data is assumed to vary in time (in d) as T(t)=3+3*sin(2*pi*(t-160)/365)';
D3 = 'Scaled functional respose for tL data is assumed to vary in time';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'No larval stages';
metaData.bibkey.F1 = 'Pick1979';
F2 = 'length-weight: log10(dry weight in g) = 3.1050*log10(shell diameter in mm) - 4.4207';
metaData.bibkey.F2 = 'Pick1979';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3RVH4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '33084577'; % Ency of Life
metaData.links.id_Wiki = 'Laevilacunaria'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3962339'; % Taxonomicon
metaData.links.id_WoRMS = '713998'; % WoRMS
metaData.links.id_molluscabase = '713998'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Laevilacunaria}}';
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
bibkey = 'Pick1979'; type = 'Article'; bib = [ ... 
'author = {G. B. Picken}, ' ... 
'year = {1979}, ' ...
'title = {Growth, production and biomass of the {A}ntarctic gastropod \emph{} {M}artens 1887}, ' ...
'journal = {J. exp. mar. Biol. Ecol.}, ' ...
'volume = {40}, ' ...
'pages = {71-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
