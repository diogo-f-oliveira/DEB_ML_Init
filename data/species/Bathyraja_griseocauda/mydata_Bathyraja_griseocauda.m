function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_griseocauda

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_griseocauda'; 
metaData.species_en = 'Graytail skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 07];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 07]; 

%% set data
% zero-variate data;
data.ab = 2*365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on v = 0.032 cm/d, as is typical for Bathyraja';
data.am = 28*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 28;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on 0.18*Li, as typical for Bathyraja';
data.Lp = 112;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 157;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Buck2006';

data.Wwi = 36.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00490*Li^3.13, see F1'; 
    
data.Ri  = 20/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.65, as is typical for Bathyraja';

% uni-variate data
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
2.927	35.077
3.837	45.319
3.866	43.021
4.861	52.243
4.888	59.908
5.858	54.057
5.858	52.780
5.913	65.810
5.913	62.489
5.914	61.212
5.914	59.168
5.914	57.891
5.915	55.591
6.852	69.922
6.852	67.367
6.967	65.326
6.967	62.771
6.968	61.494
7.961	79.658
7.991	70.717
8.901	78.916
8.902	75.339
8.903	71.252
10.893	89.952
11.919	88.956
12.884	110.185
18.978	120.560];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(7); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Buck2006'; 
comment.tL = 'Data for combined sexes';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
%weights.ab = 0 * weights.ab;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males and females are assumed not to differ';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00490 *(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5WDYY'; % Cat of Life
metaData.links.id_ITIS = '564252'; % ITIS
metaData.links.id_EoL = '46560746'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja_griseocauda'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_griseocauda'; % ADW
metaData.links.id_Taxo = '163709'; % Taxonomicon
metaData.links.id_WoRMS = '234586'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-griseocauda'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja_griseocauda}}';  
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
bibkey = 'Buck2006'; type = 'phdthesis'; bib = [ ...
'author = {Amelie B\"{u}cker}, ' ...
'year = {2006}, ' ...
'title  = {Age and growth of skates of the genus \emph{Bathyraja} in Argentina}, ' ...
'school = {University of Bremen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bathyraja-griseocauda.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
