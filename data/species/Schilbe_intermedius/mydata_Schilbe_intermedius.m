  function [data, auxData, metaData, txtData, weights] = mydata_Schilbe_intermedius
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Schilbeidae';
metaData.species    = '730+'; 
metaData.species_en = 'Silver catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 17];

%% set data
% zero-variate data
data.ab = 6.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 50;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.5e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.66 mm of Schilbe mystus: pi/6*0.066^3';
data.Wwp = 8.1;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00708*Lp^3.06, see F1';
data.Wwi = 1.1e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.00708*Li^3.06, see F1';
  
data.Ri = 62e3/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'guess';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Schilbe mystus';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.920	18.577
0.969	12.914
0.984	20.927
1.012	14.516
1.013	13.982
1.948	14.824
1.966	19.311
1.969	16.640
1.971	13.969
1.987	21.448
2.964	25.281
2.965	24.426
2.975	12.887
2.988	23.250
3.011	21.861
3.013	20.045
3.014	19.618
3.922	25.695
3.927	20.033
3.928	19.392
3.929	18.430
3.947	22.276
4.950	21.622
4.951	21.408
4.970	24.185
4.972	22.156
4.974	19.698
4.992	24.933
4.996	20.659
4.998	17.882
5.016	22.903
5.953	22.036
5.960	14.023
5.976	20.646
5.977	19.899
5.978	19.471
5.979	18.616
5.981	14.877
6.016	26.308
6.956	21.809
6.980	19.778
7.979	23.611];
data.tL(:,1) = (data.tL(:,1) + 0.6) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
  temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BootKhum2010';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.06'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4V87R'; % Cat of Life
metaData.links.id_ITIS = '681880'; % ITIS
metaData.links.id_EoL = '213033'; % Ency of Life
metaData.links.id_Wiki = 'Schilbe_intermedius'; % Wikipedia
metaData.links.id_ADW = 'Schilbe_intermedius'; % ADW
metaData.links.id_Taxo = '186737'; % Taxonomicon
metaData.links.id_WoRMS = '581713'; % WoRMS
metaData.links.id_fishbase = 'Schilbe-intermedius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Schilbe_intermedius}}';  
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
bibkey = 'BootKhum2010'; type = 'Article'; bib = [ ...
'author = {Anthony J. Booth and Nokuthula Khumalo}, ' ...
'year = {2010}, ' ...
'title = {Age, growth and reproduction of \emph{Marcusenius pongolensis}, \emph{Oreochromis mossambicus} and \emph{Schilbe intermedius} in anoligotrophic impoundment in {S}waziland}, ' ... 
'journal = {African Journal of Ecology}, ' ...
'volume = {48}, '...
'pages = {285-568}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Schilbe-intermedius.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

