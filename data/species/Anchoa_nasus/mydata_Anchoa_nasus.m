function [data, auxData, metaData, txtData, weights] = mydata_Anchoa_nasus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Anchoa_nasus'; 
metaData.species_en = 'Longnose anchovy'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L';'L-Ww';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 14];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 2.5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'fishbase';
data.Li = 17;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 1.1e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'Jose1963';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwp = 1.42; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00513*Lp^3.14, see F1';
data.Wwi = 37.5; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.14, see F1';
    
% uni-variate data

% time-length
data.LL = [ ... % std length at t (cm),std length at t+dt (cm)
4.725	5.031
4.894	5.246
5.017	5.133
5.401	5.836
5.806	5.813
5.807	6.142
6.381	6.629
6.493	6.652
6.596	7.003
6.606	6.765
6.663	7.082
6.696	6.935
6.898	6.652
6.988	6.640
7.011	7.048];
data.LL = 1.1*data.LL; % convert SL to TL
units.LL = {'cm', 'cm'};  label.LL = {'total length at t','total length at t+dt'}; 
temp.LL = C2K(25); units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'Jose1963';

% length-weight
data.LW = [ ... % std length (cm), weight (g)
   5.00 0.8
   5.19 1.1
   5.50 1.5
   5.50 1.5
   5.88 2.0
   6.95 3.2
   7.02 3.5
   7.39 4.5
   7.43 4.1
   7.50 4.5
   7.60 4.5
   8.30 5.8];
data.LW(:,1) = data.LW(:,1)*1.1; % convert SL to TL
units.LW = {'cm', 'g'};  label.LW = {'total length', 'weight'}; 
bibkey.LW = 'Jose1963';

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
5.004	941.318
5.186	1358.339
5.479	2041.881
5.487	1083.797
5.892	2197.396
6.939	2597.584
7.007	2444.373
7.367	2449.050
7.420	2459.715
7.469	4444.726
7.586	2070.959
8.292	2839.929];
data.LN(:,1) = data.LN(:,1)*1.1; % convert SL to TL
units.LN = {'cm', '#'};  label.LN = {'total length','fecundity'}; 
temp.LN = C2K(25); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Jose1963';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = 5 * weights.LL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 1.1*SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'DKT6'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46562593'; % Ency of Life
metaData.links.id_Wiki = 'Anchoa_nasus'; % Wikipedia
metaData.links.id_ADW = 'Anchoa_nasus'; % ADW
metaData.links.id_Taxo = '160857'; % Taxonomicon
metaData.links.id_WoRMS = '275528'; % WoRMS
metaData.links.id_fishbase = 'Anchoa-nasus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Anchoa_nasus}}';  
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
bibkey = 'Jose1963'; type = 'Article'; bib = [ ...  
'author = {Joseph, J.}, ' ...
'year = {1963}, ' ...
'title = {Contribution to the biology of the engraulid \emph{Anchoa naso} ({G}ilbert and {P}ierson, 1898) from {E}cuadorian waters}, ' ... 
'journal = {Bull. Inter-Amer. Trop. Tuna Comm.}, ' ...
'volume = {8(1)}, ' ...
'pages = {1-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Anchoa-nasus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
