function [data, auxData, metaData, txtData, weights] = mydata_Trachyrincus_scabrus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Trachyrincus_scabrus'; 
metaData.species_en = 'Roughsnout grenadier';

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 04 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 01]; 


%% set data
% zero-variate data

data.am = 11*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 30;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on Lp/Li of Coryphaenoides_rupestris';
data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of Coryphaenoides rupestris of 2.6 mm: 4/3*pi*0.13^3';
data.Wwi =720;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00129*Li^3.232, see F2';
  
data.Ri  = 2500/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = ';

% univariate data
% tL-data 
data.tL = [ ... % time since birth (yr), pre-anal length length (cm)
 0  5.437
 1  7.530
 2  9.417
 3 11.269
 4 12.906
 5 14.409
 6 15.763
 7 16.888
 8 17.603
 9 18.131
10 19.221];
data.tL(:,1) = 365*(1 + data.tL(:,1)); % convert yr to d
data.tL(:,2) = 2.32 * data.tL(:,2); % convert pre-anal to total length
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SionMaio2012';

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
D1 = 'max age seems very short';     
D2 = 'conversion of pre-anal PL to total length TL of tL data is based on photo: TL = 2.32 * PL';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'bathypelagic; depth range 395 - 1700 m; feeds primarily on pelagic copepods, but also takes mysids, shrimps, cephalopods, fish, polychaetes and gastropods';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Weight length: W = 0.00129*L^3.232';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '57SMC'; % Cat of Life
metaData.links.id_ITIS = '550660'; % ITIS
metaData.links.id_EoL = '46564914'; % Ency of Life
metaData.links.id_Wiki = 'Trachyrincus_scabrus'; % Wikipedia
metaData.links.id_ADW = 'Trachyrincus_scabrus'; % ADW
metaData.links.id_Taxo = '189278'; % Taxonomicon
metaData.links.id_WoRMS = '126482'; % WoRMS
metaData.links.id_fishbase = 'Trachyrincus-scabrus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachyrincus_scabrus}}';
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
bibkey = 'SionMaio2012'; type = 'Article'; bib = [ ... 
'author = {L. Sion and P. Maiorano and R. Carlucci and F. Capezzuto and A. Indennidate and A. Tursi and G. D''Onghia}, ' ... 
'year = {2012}, ' ...
'title = {Review of the Literature on Age and Growth of Grenadiers in the {M}editerranean and New Data on Age of \emph{Trachyrincus scabrus} ({M}acrouridae) in the {I}onian {S}ea}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {52}, ' ...
'number = {10}, '...
'pages = {740-749}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Trachyrincus-scabrus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

