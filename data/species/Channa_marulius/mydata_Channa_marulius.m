function [data, auxData, metaData, txtData, weights] = mydata_Channa_marulius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anabantiformes'; 
metaData.family     = 'Channidae';
metaData.species    = 'Channa_marulius'; 
metaData.species_en = 'Bullseye snakehead'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 09 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 12]; 

%% set data
% zero-variate data

data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'DuaKuma2006';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Li and tL; DuaKuma2006 could distinguish 5 yr classes';

data.Lp  = 85;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 183;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Kila1986';
  comment.Wwb = 'based on egg diameter of 1.5 mm of Channa striatus: pi/6*0.15^3';

data.Ri  = 4e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data

% time-length
data.tL = [ ... % time (yr), total length (cm)
    1 29.01
    2 41.37
    3 51.90
    4 61.63
    5 73.52];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DuaKuma2006';


% time-weight
data.tWw = [ ... % time (yr), total length (cm)
    1  441.17
    2 1164.65
    3 2070
    4 3359.09
    5 4916.66];
data.tWw(:,1) = 365 * (0.5 + data.tWw(:,1));
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'swet weight'};  
temp.tWw = C2K(27);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'DuaKuma2006';

% length - weight
data.LWw = [ ... % total length (log cm), wet weight (log g)
1.421	2.400
1.478	2.408
1.514	2.636
1.529	2.404
1.531	2.499
1.542	2.611
1.547	2.553
1.556	2.615
1.573	2.586
1.575	2.714
1.593	2.491
1.602	2.611
1.642	2.714
1.657	2.958
1.661	2.706
1.661	2.855
1.675	2.813
1.677	2.892
1.679	2.859
1.697	2.913
1.717	3.012
1.726	3.049
1.726	3.111
1.732	3.012
1.745	3.111
1.748	3.115
1.750	3.178
1.757	3.153
1.759	3.215
1.761	3.186
1.763	3.115
1.768	3.223
1.770	3.256
1.776	3.256
1.781	3.182
1.781	3.198
1.781	3.223
1.790	3.256
1.794	3.256
1.808	3.521
1.810	3.397
1.810	3.405
1.812	3.256
1.812	3.446
1.823	3.384
1.832	3.438
1.834	3.480
1.836	3.301
1.838	3.372
1.847	3.475
1.860	3.405
1.860	3.434
1.862	3.368
1.865	3.405
1.865	3.450
1.867	3.521
1.880	3.529
1.882	3.483
1.911	3.612
1.918	3.707
1.924	3.641
1.931	3.678
1.942	3.707];
data.LWw = 10.^data.LWw; % remove log transform
units.LWw = {'cm', 'g'}; label.LWw = {'standard length', 'wet weight'};  
bibkey.LWw = 'DuaKuma2006';
  
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

%% Links
metaData.links.id_CoL = 'TM3H'; % Cat of Life
metaData.links.id_ITIS = '166663'; % ITIS
metaData.links.id_EoL = '212040'; % Ency of Life
metaData.links.id_Wiki = 'Channa_marulius'; % Wikipedia
metaData.links.id_ADW = 'Channa_marulius'; % ADW
metaData.links.id_Taxo = '170524'; % Taxonomicon
metaData.links.id_WoRMS = '1026844'; % WoRMS
metaData.links.id_fishbase = 'Channa-marulius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Channa_marulius}}';
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
bibkey = 'DuaKuma2006'; type = 'Article'; bib = [ ... 
'author = {Anish Dua and Kanwaljit Kumar}, ' ... 
'year = {2006}, ' ...
'title = {Age and growth patterns in \emph{Channa marulius} from {H}arike Wetland (A {R}amsar site), {P}unjab, {I}ndia}, ' ...
'journal = {Journal of Environmental Biology}, ' ...
'volume = {27}, ' ...
'number = {2}, '...
'pages = {377-380}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kila1986'; type = 'Article'; bib = [ ... 
'author = {R. V. Kilambi}, ' ... 
'year = {1986}, ' ...
'title = {Age, growth and reproductive strategy of the snakehead, \emph{Ophicephalus striatus} {B}loch, from {S}ri {L}anka}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {29}, ' ...
'pages = {13-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Channa-marulius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

