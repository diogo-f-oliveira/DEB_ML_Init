function [data, auxData, metaData, txtData, weights] = mydata_Desmognathus_fuscus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Desmognathus_fuscus'; 
metaData.species_en = 'Northern dusky salamander'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww';'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 15];

%% set data
% zero-variate data

data.ab = 56;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Dans1975';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Dans1975';
  temp.tpm = C2K(15);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 19.8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.93;    units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Dans1975';
data.Lp  = 4.0;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';   bibkey.Lp  = 'Dans1975';
  comment.Lp = 'based on tp and tL data';
data.Li  = 6.5;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Dans1975';
  comment.Li = 'based on extrapolating tL data';

data.Wwb = 9e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Dans1975';
  comment.Wwb = 'data for June, 5 mg for May, 3 for April';
data.Wwi = 5.7;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on D. monticola: (6.5/6.6)^3*6';

data.Ri  = 33/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Dans1975';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '33 eggs per clutch, 1 clutch each other yr';

% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), SVL (cm)
0	0.929 0.937
1	2.095 2.052
2	3.102 3.120
3	4.141 4.283
4	4.942 5.192
5	NaN   5.783
6	NaN   6.119];
data.tL_fm(:,1) = data.tL_fm(:,1) * 365; % convert yr to d
units.tL_fm  = {'d', 'cm'}; label.tL_fm = {'time since birth', 'snout-to-vent length'};  
temp.tL_fm   = C2K(15); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Dans1975'; treat.tL_fm = {1, {'females','males'}}; 
comment.tL_fm = 'Data for females, males from Blue Ridge South, North Carolina';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures were guessed';
D2 = 'Males are assumed todiffer fom females by E_Hp only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '353MK'; % Cat of Life
metaData.links.id_ITIS = '173633'; % ITIS
metaData.links.id_EoL = '1025387'; % Ency of Life
metaData.links.id_Wiki = 'Desmognathus_fuscus'; % Wikipedia
metaData.links.id_ADW = 'Desmognathus_fuscus'; % ADW
metaData.links.id_Taxo = '47397'; % Taxonomicon
metaData.links.id_WoRMS = '1369392'; % WoRMS
metaData.links.id_amphweb = 'Desmognathus+fuscus'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Desmognathus_fuscus}}';
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
bibkey = 'Dans1975'; type = 'Article'; bib = [ ... 
'author = {Rudolph Theodore Danstedt}, ' ... 
'year = {1975}, ' ...
'title = {Local Geographic Variation in Demographic Parameters and Body Size of \emph{Desmognathus fuscus} ({A}mphibia: {P}lethodontidae))}, ' ...
'journal = {Ecology}, ' ...
'volume = {56(5)}, ' ...
'pages = {1054-1067}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Desmognathus+fuscus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

