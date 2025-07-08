function [data, auxData, metaData, txtData, weights] = mydata_Orectolobus_ornatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Orectolobiformes'; 
metaData.family     = 'Orectolobidae';
metaData.species    = 'Orectolobus_ornatus'; 
metaData.species_en = 'Ornate wobbegong'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MISE', 'MPSW'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2019 01 11];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 11]; 

%% set data
% zero-variate data;
data.ab = 353;     units.ab = 'd';   label.ab = 'age at birth';                bibkey.ab = 'guess';    
  temp.ab = C2K(19); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;  units.am = 'd';   label.am = 'life span';                    bibkey.am = 'HuveStea2013';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 20;  units.Lb  = 'cm'; label.Lb  = 'total length at birth';    bibkey.Lb  = 'HuveStea2013';
data.Lp  = 94;  units.Lp = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 290; units.Li = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
  comment.Li = 'Wiki gives 117 cm as max reported'; 

data.Wwb  = 44.5;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';        bibkey.Wwb  = {'HuveStea2013','fishbase'};
  comment.Wwi = 'based on 0.00389*Lb^3.12, see F1';
data.Wwi  = 187e3;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';

data.Ri  = 78/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';         bibkey.Ri  = 'guess';   
  temp.Ri = C2K(19);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
4.959	51.196
6.049	59.735
7.005	59.761
7.994	62.979
8.984	66.196
10.038	64.097
11.031	78.485
11.954	79.041
13.009	81.197
13.998	84.947
14.922	87.631
15.976	88.191
16.965	89.281
17.954	90.371
18.944	96.249
19.932	94.147];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};
temp.tL = C2K(19); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HuveStea2013';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12 ';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '754MR'; % Cat of Life
metaData.links.id_ITIS = '159869'; % ITIS
metaData.links.id_EoL = '46559692'; % Ency of Life
metaData.links.id_Wiki = 'Orectolobus_ornatus'; % Wikipedia
metaData.links.id_ADW = 'Orectolobus_ornatus'; % ADW
metaData.links.id_Taxo = '94268'; % Taxonomicon
metaData.links.id_WoRMS = '281932'; % WoRMS
metaData.links.id_fishbase = 'Orectolobus-ornatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Orectolobus_ornatus}}';  
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
bibkey = 'HuveStea2013'; type = 'Article'; bib = [ ...
'author = {Charlie Huveneers and Joanna Stead and Michael B. Bennett and Kate A. Lee and Robert G. Harcourt}, ' ...
'year = {2013}, ' ...
'title = {Age and growth determination of three sympatric wobbegong sharks: {H}ow reliable is growth band periodicity in {O}rectolobidae?}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {147}, '...
'pages = {413-425}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Orectolobus-ornatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
