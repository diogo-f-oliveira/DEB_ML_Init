function [data, auxData, metaData, txtData, weights] = mydata_Tactostoma_macropus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Stomiiformes'; 
metaData.family     = 'Stomiidae';
metaData.species    = 'Tactostoma_macropus'; 
metaData.species_en = 'Longfin dragonfish';

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 07];

%% set data
% zero-variate data
data.am = 5.5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(4.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30.5;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'FiscPear1983';
data.Li = 34.3;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 6e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.05 mm: pi/6*0.105^3';
data.Wwp = 32.4; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00093*Lp^3.06, see F3';
data.Wwi = 46.4;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00093*Li^3.06, see F3';

data.Ri = 66000/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'fishbase';
  temp.Ri = C2K(4.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% tL data
data.tL = [ ... % time since birth (yr), standard length (cm) 
0.076	3.561
0.310	6.107
0.322	5.799
0.402	6.904
0.414	6.104
0.503	7.608
0.507	6.594
0.619	8.620
0.736	9.908
0.752	8.617
0.763	9.631
0.764	9.016
0.832	8.585
0.889	9.966
0.917	10.918
0.921	9.013
0.933	9.904
1.082	12.973
1.086	9.686
1.090	13.588
1.154	10.422
1.158	12.142
1.162	11.528
1.174	11.005
1.231	13.739
1.254	10.973
1.255	12.048
1.355	14.596
1.464	13.580
1.528	15.730
1.580	16.435
1.613	16.097
1.645	13.945
1.669	14.682
1.685	14.405
1.753	16.555
1.826	17.782
1.830	14.955
1.854	14.863
1.906	17.965
1.910	15.906
1.914	17.166
1.979	17.963
1.991	17.441
1.999	17.103
2.007	16.918
2.055	16.702
2.075	18.453
2.131	17.868
2.160	17.314
2.167	16.085
2.168	18.420
2.172	15.932
2.260	19.433
2.421	19.337
2.429	17.370
2.590	19.917
2.759	19.392
2.940	19.265
2.995	21.107
2.996	19.940];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(4.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FiscPear1983';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00093*(SL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54GFZ'; % Cat of Life
metaData.links.id_ITIS = '162247'; % ITIS
metaData.links.id_EoL = '46563646'; % Ency of Life
metaData.links.id_Wiki = 'Tactostoma_macropus'; % Wikipedia
metaData.links.id_ADW = 'Tactostoma_macropus'; % ADW
metaData.links.id_Taxo = '188751'; % Taxonomicon
metaData.links.id_WoRMS = '282922'; % WoRMS
metaData.links.id_fishbase = 'Tactostoma-macropus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tactostoma_macropus}}';
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
bibkey = 'FiscPear1983'; type = 'article'; bib = [ ...
'doi = {10.1007/BF00403449}, ' ...
'author = {Fisher, J.P. and Pearcy, W.G.}, ' ... 
'year   = {1983}, ' ...
'title  = {Reproduction, growth and feeding of the mesopelagic fish \emph{Tactostoma macropus} ({M}elanostomiatidae)}, ' ...
'journal = {Marine Biology}, ' ...
'page = {257–267}, ' ...
'volume = {74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Tactostoma-macropus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

