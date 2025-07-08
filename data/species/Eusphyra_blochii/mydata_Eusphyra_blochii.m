function [data, auxData, metaData, txtData, weights] = mydata_Eusphyra_blochii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Sphyrnidae';
metaData.species    = 'Eusphyra_blochii'; 
metaData.species_en = 'Winghead shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 22];


%% set data
% zero-variate data

data.ab = 10*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'fishbase';   
  temp.ab = C2K(28.3); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '9-11 mnth';
data.am = 21*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'SmarHarr2013';   
  temp.am = C2K(28.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 38;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
  comment.Lb = '32-45 cm';
data.Lp  = 120;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 186;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 118.4e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.24, see F1';

data.Ri  = 18/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 till 25 pups per yr';

% uni-variate data
 
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
0.000	50.163
0.000	44.673
0.000	40.752
1.017	73.651
1.020	65.024
1.022	57.965
1.875	72.049
1.940	83.811
1.942	78.321
2.966	95.536
3.037	88.474
3.039	82.200
3.957	110.399
3.961	97.065
3.962	90.791
4.028	101.769
4.916	113.499
4.948	123.693
4.953	104.085
5.024	97.808
5.941	129.929
5.943	121.301
5.946	113.458
5.947	108.752
5.949	101.693
6.899	136.950
6.902	126.754
6.904	120.479
6.905	116.558
6.907	110.283
7.999	132.201
8.001	125.142
8.003	117.299
8.004	113.377
8.861	117.265
8.926	126.675
8.956	143.144
8.959	133.732
9.987	136.045
9.991	121.143
10.945	146.203
10.951	125.027
11.973	150.085
12.047	131.258
13.000	158.672
13.006	136.711
13.993	164.123
14.033	142.161
15.027	146.043
16.020	153.063
16.980	156.163
17.939	159.262
18.967	163.144
20.064	166.238];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'SmarHarr2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00525 * (TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6HGWQ'; % Cat of Life
metaData.links.id_ITIS = '160527'; % ITIS
metaData.links.id_EoL = '46559957'; % Ency of Life
metaData.links.id_Wiki = 'Eusphyra_blochii'; % Wikipedia
metaData.links.id_ADW = 'Eusphyra_blochii'; % ADW
metaData.links.id_Taxo = '106465'; % Taxonomicon
metaData.links.id_WoRMS = '280757'; % WoRMS
metaData.links.id_fishbase = 'Eusphyra-blochii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eusphyra_blochii}}';
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
bibkey = 'SmarHarr2013'; type = 'Article'; bib = [ ... 
'doi = {10.1002/aqc.2274}, ' ...
'author = {Jonathan J. Smart and Alastair V. Harry and Andrew J. Tobin and Colin A. Simpfendorfer}, ' ... 
'year = {2013}, ' ...
'title = {Overcoming the constraints of low sample sizes to produce age and growth data for rare or threatened sharks}, ' ...
'journal = {Aquatic Conserv: Mar. Freshw. Ecosyst.}, ' ...
'volume = {23}, ' ...
'pages = {124-134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Eusphyra-blochii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

