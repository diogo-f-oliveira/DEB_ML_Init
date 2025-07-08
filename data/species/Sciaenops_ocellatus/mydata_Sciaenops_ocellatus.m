function [data, auxData, metaData, txtData, weights] = mydata_Sciaenops_ocellatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Sciaenops_ocellatus'; 
metaData.species_en = 'Red drum'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2022 05 21];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.curator        = {'Starrlight Augustine'};
metaData.email_cur      = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc       = [2022 05 21];

%% set data
% zero-variate data

data.tp = 4*365; units.tp = 'd';    label.tp = 'time since birth at puberty';               bibkey.tp = 'Wiki';   
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 60*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Wiki';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 68;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Wiki';
  comment.Lp = '66-70 cm';
data.Li  = 115;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
data.Lim  = 100;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length';  bibkey.Lim  = 'fishbase';

data.Wwb = 5.3e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Rich2005';
  comment.Wwb = 'based on egg diameter of 1 mm for black drum, with which it hybridizes: pi/6*0.1^3';
data.Wwp = 3.7e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Wiki';
  comment.Wwp = '3.4-4 kg';
data.Wwi = 45e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri = 3.5e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length data
data.tWw = [ ... % time(d), wet weight (g)
    0  7.1
    39 12.3
    69 23.8
    92 28.4
    126 37.3
    157 48.9
    188 76.9
    215 106.5
    242 122.6
    274 143.2
    303 165.9
    333 287.6];
units.tWw   = {'d', 'g'};  label.tWw = {'time', 'wet weight'};  
temp.tWw    = C2K(25);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'VelaVill2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4VH94'; % Cat of Life
metaData.links.id_ITIS = '169290'; % ITIS
metaData.links.id_EoL = '46579060'; % Ency of Life
metaData.links.id_Wiki = 'Sciaenops_ocellatus'; % Wikipedia
metaData.links.id_ADW = 'Sciaenops_ocellatus'; % ADW
metaData.links.id_Taxo = '187007'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Sciaenops-ocellatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sciaenops_ocellatus}}';
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
bibkey = 'VelaVill2018'; type = 'Article'; bib = [ ... 
'author = {Miguel A. Vela and Humberto Villarreal and Marcelo Araneda}, ' ... 
'year = {2018}, ' ...
'doi = {10.1111/jwas.12546}, ' ...
'title = {Growth and survival of juvenile red drum, \emph{Sciaenops ocellatus}, acclimated to freshwater at three different stocking densities in a partial recirculation system}, ' ...
'journal = {J World Aquacult Soc.}, ' ...
'pages = {1-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rich2005'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {William J. Richards}, ' ...
'year = {2005}, ' ...
'title  = {Early Stages of Atlantic Fishes: An Identification Guide for the Western Central North Atlantic}, ' ...
'volume = {1}, ' ...
'publisher = {Taylor \& Francis}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sciaenops-ocellatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

